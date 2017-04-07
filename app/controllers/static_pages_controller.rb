class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @feeds = Feed.all.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
  end
  
  def angular
  end
  
  def contact
  end
end
