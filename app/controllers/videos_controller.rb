###
# Controller para exibição dos vídeos do grupo
###
class VideosController < ApplicationController

  # Listagem de vídeos do grupo, buscados diretamente do canal do GPS no youtube
  # @todo Os vídeos são carregados inicialmente através do seeder do rails,
  #       mas é importante que se possa efetuar uma atualização das informações
  #       de preferência através de uma interface de administração 
  def index end
  def page
    @videos = Video.limit(10)
                   .offset(10 * params[:offset].to_i - 20)
                   .order_by(uploaded: :desc)
    render json: @videos
  end

end
