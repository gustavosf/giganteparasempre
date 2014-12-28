class HomeController < ApplicationController

  def gps_na_midia
  end

  def gps_na_midia_pager
    @links = Link.limit(6)
                 .where(group: 'gps-na-midia')
                 .offset(6 * params[:offset].to_i - 12)
                 .order_by(date: :desc)
    render json: @links
  end

end
