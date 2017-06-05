class FeedsController < ApplicationController
  
  before_action :logged_in_user, if: -> { !json_request? }
  before_action :authenticate_request, only: [:create], if: -> { json_request? }
  
  def index
    @feeds = Feed.paginate(page: params[:page])
  end
  
  def create
    @kit = Kit.find(params[:kit_id])
    @feed = @kit.feeds.build(tipo: params[:tipo])
    if (@kit.feeds.first.tipo != @feed.tipo) && @feed.save
      render json: { status: "Success" } , status: 200
      # Handle a successful save.
    else
      render json: { status: "Unauthorized" }, status: :unauthorized
    end
  end
  
  private
    
    def json_request?
      request.format.json?
    end
      
end
