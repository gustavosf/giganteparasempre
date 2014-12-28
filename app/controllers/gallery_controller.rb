class GalleryController < ApplicationController

  def index
    @albuns = Album.all
  end

  def show
    @album = Album.where(slug: params[:slug]).first
    redirect_to :gallery if @album.nil?
  end

  def page
    @items = Item.where(album: params[:slug])
                 .limit(15)
                 .offset(15 * params[:offset].to_i - 15)
    render json: @items
  end
end
