class AlunosController < ApplicationController
  
 # before_action :logged_in_user, only: [:index, :create, :new, :show]

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
    @kits = @aluno.kits.paginate(page: params[:page], :per_page => 3)
    @feeds = @aluno.feeds.paginate(page: params[:page], :per_page => 3)
  end
  
  private
  
    def aluno_params
      params.require(:aluno).permit(:nome, :email, :matricula)
    end
  
end
