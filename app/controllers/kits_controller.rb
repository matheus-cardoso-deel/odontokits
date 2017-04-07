class KitsController < ApplicationController
       
  before_action :authenticate_request, if: -> { json_request? }

    def index
      @kits = Kit.all
    end
    
    def show
      @kit = Kit.find(params[:id])
      @aluno = Aluno.find(@kit.aluno_id) #not really necessary (just for the title of the page)
      @feeds = @kit.feeds.paginate(page: params[:page], :per_page => 5)
    end
    
    def new
      @kit = Kit.new
      @aluno = Aluno.find_by(id: params[:aluno_id])
    end
    
    def create
      @aluno = Aluno.find_by(id: params[:aluno_id])
      #qr_code_img = RQRCode::QRCode.new(kit_params.dig(:nome), :size => 4, :level => :h ).to_img.resize(150, 150) #alternative to the approach below
      #@kit = @aluno.kits.build(:nome => kit_params.dig(:nome), :image => qr_code_img.to_string)
      @kit = @aluno.kits.build(kit_params)
      qr_code_img = RQRCode::QRCode.new(@kit.nome, :size => 4, :level => :h ).to_img.
      resize(150, 150)
      @kit.update_attribute :image, qr_code_img.to_string

      if @kit.save
        flash[:success] = "Kit created!"
        redirect_to @aluno
      else
        render 'static_pages/home'
      end
    end
    
    private
 
      def kit_params
        params.require(:kit).permit(:nome)
      end 
      
      def json_request?
        request.format.json?
      end
      
end
