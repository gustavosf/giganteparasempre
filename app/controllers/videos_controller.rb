class VideosController < ApplicationController

  def index
  end

  def page
    @videos = Video.limit(10)
                   .offset(10 * params[:offset].to_i - 20)
                   .order_by(uploaded: :desc)
    render json: @videos
  end

end
