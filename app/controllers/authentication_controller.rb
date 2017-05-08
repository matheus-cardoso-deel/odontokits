class AuthenticationController < ApplicationController

  def authenticate_user
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
  
  def authenticate_aluno
    command = AuthenticateAluno.call(params[:matricula], params[:password])

    if command.success?
      render json: { status: "Success" } , status: 200
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end