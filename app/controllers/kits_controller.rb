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

      if @kit.save
        # NOM:Bruno C. Cardoso;MAT:2012939548;PER:7;KIT:17;ITM:Caixa com pano
        content = 'NOM:' + @aluno.nome + 'MAT:' + @aluno.matricula + 'PER:' +
        @aluno.periodo.to_s + 'KIT:' + @kit.id.to_s + 'ITM:' + @kit.nome
      
        qr_code_img = RQRCode::QRCode.new(content, :size => 7, :level => :h).to_img.
        resize(150, 150)
      
        @kit.update_attribute :image, qr_code_img.to_string

        flash[:success] = "Kit created!"
        redirect_to @aluno
      else
        render 'static_pages/home'
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
      if @kit.update_attributes(kit_params)
        flash[:success] = "Kit atualizado"
        redirect_to @kit    
      else
      render 'edit'
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
