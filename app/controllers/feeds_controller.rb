class FeedsController < ApplicationController
  
  before_action :logged_in_user, if: -> { !json_request? }
  before_action :authenticate_request, only: [:create], if: -> { json_request? }
  
  def index
    @feeds = Feed.paginate(page: params[:page])
  end
  
  def create
    @kit = Kit.find(params[:kit_id])
    @feed = @kit.feeds.build(tipo: params[:tipo])
    
    if @kit.feeds.count < 1 && @feed.tipo == "Entrada" && @feed.save
        render json: { status: "Success" } , status: 200
        return
      # Handle a successful first save.
    elsif @kit.feeds.count >= 1 && (@kit.feeds.first.tipo != @feed.tipo) && @feed.save
      render json: { status: "Success" } , status: 200
      # Handle a successful save.
    else
      render json: { status: "Bad Request" }, status: :bad_request
    end
  end
  
  private
    
    def json_request?
      request.format.json?
    end
      
end
