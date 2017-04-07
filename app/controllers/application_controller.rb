class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  #skip_before_filter :verify_authenticity_token
  include SessionsHelper
  
  attr_reader :current_api_user
  
    private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    #API Authentication
    def authenticate_request
      render json: { error: AuthorizeApiRequest.call(request.headers).errors }, status: 401 unless AuthorizeApiRequest.call(request.headers).result

    end
end
