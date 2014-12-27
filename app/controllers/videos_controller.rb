class VideosController < ApplicationController

  def index
    @videos = Video.limit 10
  end

  def page
    @videos = Video.limit(10)
                   .offset(10 * params[:offset].to_i)
    render json: @videos
  end

end
