class GalleryController < ApplicationController

  def index
    @albuns = Album.all
  end

  def show
    @album = Album.where(slug: params[:slug]).first
    redirect_to :gallery if @album.nil?
  end

  def page
    photos = Photo.where(album: params[:slug])
                  .order_by(likes: :desc) # Bota as mais curtidas em cima
                  .limit(15)
                  .offset(15 * params[:offset].to_i - 15)

    # Inclui os parametros "full" e "thumb" indicando o local das imagens
    # em baixa e alta resolução
    render json: photos.map { |photo|
      photo['full'] = photo.full
      photo['thumb'] = photo.thumb
      p photo
    }
  end
end
