class VideosController < ApplicationController

  def index
    @videos = Video.limit(10)
                   .order_by(updated: :desc)
  end

  def page
    @videos = Video.limit(10)
                   .offset(10 * params[:offset].to_i - 10)
                   .order_by(updated: :desc)
    render json: @videos
  end

end
