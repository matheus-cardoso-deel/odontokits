class FeedsController < ApplicationController
  
  before_action :authenticate_request, only: [:create]
  
  def index
    @feeds = Feed.paginate(page: params[:page])
  end
  
  def create
    @kit = Kit.find(params[:kit_id])
    @feed = @kit.feeds.build(feed_params)
    if @feed.save
      render json: { status: "Success" } , status: 200
      # Handle a successful save.
    else
      redirect_to root_path
    end
  end
  
  private
  
    def feed_params
      params.require(:feed).permit(:tipo)
    end
end
