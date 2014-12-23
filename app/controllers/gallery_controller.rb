class GalleryController < ApplicationController
  def index
  end

  def show
    @album = Album.where(slug: params[:id]).first
    redirect_to :gallery if @album.nil?
    @items = Item.where(album: params[:id]).limit(10)
  end

  def page
    @items = Item.where(album: params[:id])
                 .limit(10)
                 .offset(10 * params[:offset].to_i)
    render json: @items
  end
end
