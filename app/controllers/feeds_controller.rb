class FeedsController < ApplicationController
  
  before_action :logged_in_user, if: -> { !json_request? }
  before_action :authenticate_request, only: [:create], if: -> { json_request? }
  
  def index
    @feeds = Feed.paginate(page: params[:page])
  end
  
  def create
    @kit = Kit.find(params[:kit_id])
    @feed = @kit.feeds.build(tipo: params[:tipo])

    # Handle a successful first save.
    if @kit.feeds.count < 1 && @feed.tipo == "Entrada" && @feed.save
        AlunoMailer.receipt_email(@feed).deliver_later
        render json: { status: "success" } , status: 200
        return
    # Handle a successful save.
    elsif @kit.feeds.count >= 1 && (@kit.feeds.first.tipo != @feed.tipo) && @feed.save
      AlunoMailer.receipt_email(@feed).deliver_later
      render json: { status: "success" } , status: 200
    else
      render json: { status: "Bad Request" }, status: :bad_request
    end
  end
  
  private
    
    def json_request?
      request.format.json?
    end
      
end
