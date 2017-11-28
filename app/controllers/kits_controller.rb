class KitsController < ApplicationController
  
  before_action :logged_in_user, if: -> { !json_request? }
 # before_action :authenticate_request, if: -> { json_request? }

    def index
      @kits = Kit.all
    end
    
    def show
      @kit = Kit.find(params[:id])
      @feeds = @kit.feeds.paginate(page: params[:page], :per_page => 5)
    end
    
    def new
      @kit = Kit.new
      @aluno = Aluno.find_by(id: params[:aluno_id])
    end
    
    def create
      @aluno = Aluno.find_by(id: params[:aluno_id])
      @kit = @aluno.kits.build(kit_params)

      content = @aluno.matricula + ";" + @kit.kit_type.id.to_s
      
      qr_code_img = RQRCode::QRCode.new(content, :size => 3, :level => :h).to_img.
      resize(150, 150)

      if @kit.save && (@kit.update_attribute :image, qr_code_img.to_string)
        # 2012939548;17
        flash[:success] = "Kit created!"
        redirect_to @aluno
      else
        render 'new'
      end
    end
    
    def destroy
      aluno = Kit.find(params[:id]).aluno
      Kit.find(params[:id]).destroy
      flash[:success] = "Kit excluído!"
      redirect_to aluno
    end
    
    def edit
    @kit = Kit.find(params[:id])
    @aluno = @kit.aluno
    end
    
    def update
      @kit = Kit.find(params[:id])
      @aluno = @kit.aluno
      content = @aluno.matricula + ";" + kit_params[:kit_type_id]
      qr_code_img = RQRCode::QRCode.new(content.to_s, :size => 3, :level => :h).to_img.resize(150, 150)

      if @kit.update_attributes(kit_params) && (@kit.update_attribute :image, qr_code_img.to_string)
        flash[:success] = "Kit atualizado"
        redirect_to @kit    
      else
      render 'edit'
      end
    end

    private
 
      def kit_params
        params.require(:kit).permit(:kit_type_id)
      end 
      
    def json_request?
      request.format.json?
    end
      
end
