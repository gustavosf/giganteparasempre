###
# Controller para exibição das fotos do grupo
###
class GalleryController < ApplicationController

  # Exibe a listagem de álbuns
  def index
    @albuns = Album.all
  end

  # Exibe a listagem de fotos de um álbum
  def show
    @album = Album.where(slug: params[:slug]).first
    redirect_to :gallery if @album.nil?
  end

  # Paginação das fotos de um álbum
  # Ordena pelas fotos mais curtidas, colocando-as em cima
  def page
    photos = Photo.where(album: params[:slug])
                  .order_by(likes: :desc) # Bota as mais curtidas em cima
                  .limit(15)
                  .offset(15 * params[:offset].to_i - 15)
    render json: photos
  end
end
