class KitTypesController < ApplicationController
    
    before_action :logged_in_user, if: -> { !json_request? }

    def index
      @kit_types = KitType.all
    end
    
    def new
        @kit_type = KitType.new
    end
    
    def create
        @kit_type = KitType.new(kit_type_params)
        
        if @kit_type.save
            flash[:success] = "Kit Type created!"
            redirect_to @kit_type
        else
            render 'new'
        end
    end
    
    def show
        @kit_type = KitType.find(params[:id])
    end
    
    def edit
        @kit_type = KitType.find(params[:id])
    end
    
    def update
      @kit_type = KitType.find(params[:id])
      if @kit_type.update_attributes(kit_type_params)
        flash[:success] = "Tipo de Caixa atualizado"
        redirect_to @kit_type    
      else
      render 'edit'
      end
    end
    
    def destroy
      KitType.find(params[:id]).destroy
      flash[:success] = "Kit excluído!"
      redirect_to root_path
    end
    
    private
 
        def kit_type_params
            params.require(:kit_type).permit(:type_name)
        end
      
        def json_request?
          request.format.json?
        end
end
