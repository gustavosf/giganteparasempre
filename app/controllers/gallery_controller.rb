class GalleryController < ApplicationController

  def index
    @albuns = Album.all
  end

  def show
    @album = Album.where(slug: params[:slug]).first
    redirect_to :gallery if @album.nil?
    @items = Item.where(album: params[:slug]).limit(20)
  end

  def page
    @items = Item.where(album: params[:slug])
                 .limit(10)
                 .offset(10 * params[:offset].to_i)
    render json: @items
  end
end
