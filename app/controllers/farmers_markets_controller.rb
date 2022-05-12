class FarmersMarketsController < ApplicationController

  def index
    @farmers_markets = FarmersMarket.ordered_by_creation
  end

  def show
    @farmers_market = FarmersMarket.find(params[:id])
  end

end
