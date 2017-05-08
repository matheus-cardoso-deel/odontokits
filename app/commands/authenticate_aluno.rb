class AuthenticateAluno
  prepend SimpleCommand
  
  def initialize(matricula, password) 
    @matricula = matricula
    @password = password 
  end 
  
  def call
    aluno
  end 
  
  private
  
  attr_accessor :matricula, :password
  
  def aluno
    aluno = Aluno.find_by_matricula(matricula) 
    return aluno if aluno && aluno.authenticate(password)
    
    errors.add :user_authentication, 'invalid credentials' 
    nil 
  end
  
end