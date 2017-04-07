class SessionsController < ApplicationController
    
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    
    respond_to do |format|
      if @user && @user.authenticate(params[:session][:password])
        format.html {
          log_in @user
          params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
          redirect_back_or root_path
          # Log the user in and redirect to the most recent visited page or the user show page.
        }
        format.json { render :show, status: :created }
      else
        format.html {
          flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
          render 'new'
        }
        format.json { render json: 'Invalid email/password combination', status: :unprocessable_entity }
        # Create an error message.
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
