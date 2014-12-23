class GalleryController < ApplicationController
  def index
  end

  def show
    @album = Album.where(slug: params[:id]).first
    redirect_to :gallery if @album.nil?
    @items = Item.where(album: params[:id]).limit(20)
  end
end
