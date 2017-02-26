class SessionsController < ApplicationController
    
  def new
  end

  def create
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or @user
        # Log the user in and redirect to the most recent visited page or the user show page.
      else
        flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
        render 'new'
        # Create an error message.
      end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
