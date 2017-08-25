class AlunosController < ApplicationController
  
   before_action :logged_in_user

  def index
    @alunos = Aluno.paginate(page: params[:page])
  end
  
  def create
    @aluno = Aluno.new(aluno_params)
    if @aluno.save
      flash[:success] = "Aluno criado!"
      redirect_to @aluno #redirect_to aluno_url(@aluno)
      # Handle a successful save.
    else
      render 'new'
    end
  end
  
  def new
    @aluno = Aluno.new
  end
  
  def show
    @aluno = Aluno.find(params[:id])
    @kits = @aluno.kits.paginate(page: params[:page], :per_page => 4)
    @feeds = @aluno.feeds.paginate(page: params[:page], :per_page => 3)
  end
  
  def destroy
    Aluno.find(params[:id]).destroy
    flash[:success] = "Aluno excluído!"
    redirect_to alunos_url
  end
  
  def edit
    @aluno = Aluno.find(params[:id])
  end

  def edit_password
    @aluno = Aluno.find(params[:aluno_id])
  end
  
  def update
    @aluno = Aluno.find(params[:id])
    if @aluno.update_attributes(aluno_params)
      flash[:success] = "Aluno atualizado"
      redirect_to @aluno    
    else
    render 'edit'
    end
  end

  def update_password
    @aluno = Aluno.find(params[:aluno_id])
    if @aluno.update_attributes(aluno_params)
      flash[:success] = "Senha atualizada"
      redirect_to @aluno    
    else
    render 'edit_password'
    end
  end
  
  private
  
    def aluno_params
      params.require(:aluno).permit(:nome, :email, :matricula,
        :periodo, :password, :password_confirmation)
    end
  
end
