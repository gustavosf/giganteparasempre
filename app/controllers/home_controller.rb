class HomeController < ApplicationController

  def index_pager
                       # .where(homepage: true)
    @elements = Element.limit(10)
                       .where(homepage: true)
                       .offset(10 * params[:offset].to_i - 20)
    render json: @elements 
  end

  def gps_na_midia
  end

  def gps_na_midia_pager
    @links = Link.limit(6)
                 .where(group: 'gps-na-midia')
                 .offset(6 * params[:offset].to_i - 12)
                 .order_by(date: :desc)
    render json: @links
  end

  def clipping
    render :gps_na_midia
  end

  def clipping_pager
    @links = Link.limit(6)
                 .where(group: 'clipping')
                 .offset(6 * params[:offset].to_i - 12)
                 .order_by(date: :desc)
    render json: @links
  end

end
