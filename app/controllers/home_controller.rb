###
# Controller para aplicações gerais
###
class HomeController < ApplicationController

  # Index page
  #
  # Carrega elementos que estejam marcados como homepage, dando preferência
  # para aqueles que também estão marcados como featured
  #
  # @todo Ver um jeito de definir um ordenamento, possívelmente transformando
  #       o campo featured em uma data (featured_date)
  def index end
  def index_pager
    @elements = Element.limit(10)
                       .where(homepage: true)
                       .order_by([:featured, :desc])
                       .offset(10 * params[:offset].to_i - 20)
    render json: @elements 
  end

  # Clipping de notícias sobre as obras do Beira-Rio
  def clipping end
  def clipping_pager
    @links = Link.limit(6)
                 .where(group: 'clipping')
                 .offset(6 * params[:offset].to_i - 12)
                 .order_by(date: :desc)
    render json: @links
  end

  # Clipping apenas com as vezes em que o GPS apareceu na mídia
  def gps_na_midia end
  def gps_na_midia_pager
    @links = Link.limit(6)
                 .where(group: 'gps-na-midia')
                 .offset(6 * params[:offset].to_i - 12)
                 .order_by(date: :desc)
    render json: @links
  end

  # Exibe conteúdo no formato de blog
  def blog
    @post = Post.where(slug: params[:slug]).first
  end

end
