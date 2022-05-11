class FarmersMarketsController < ApplicationController
  def index
    @farmers_markets = FarmersMarket.all
  end

  def show
    @farmers_market = FarmersMarket.find(params[:id])
  end


end
