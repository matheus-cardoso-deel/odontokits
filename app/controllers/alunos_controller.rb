class AlunosController < ApplicationController
  
   before_action :logged_in_user

  def index
    #@alunos = Aluno.paginate(page: params[:page])
    @q = Aluno.ransack(params[:q])
    @alunos = @q.result(distinct: true).paginate(page: params[:page], :per_page => 10)
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
    @kits = @aluno.kits.paginate(page: params[:page], :per_page => 40)
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

  def get_alterar_periodo
  end

  def alterar_periodo
    if params[:up]
      Aluno.all.each do |aluno|
        if aluno.periodo.to_i > 0
          aluno.update!(periodo: aluno.periodo.to_i + 1)
          flash[:success] = "Períodos aumentados em 1!"
        end
      end
    else
      Aluno.all.each do |aluno|
        if aluno.periodo.to_i > 0
          aluno.update!(periodo: aluno.periodo.to_i - 1)
          flash[:success] = "Períodos diminuidos em 1!"
        end
      end
    end
    redirect_to alterar_periodo_path
  end
  
  private
  
    def aluno_params
      params.require(:aluno).permit(:nome, :email, :matricula,
        :periodo, :password, :password_confirmation)
    end
  
end
