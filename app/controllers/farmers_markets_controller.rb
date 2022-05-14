class FarmersMarketsController < ApplicationController

  def index
    @farmers_markets = FarmersMarket.ordered_by_creation
  end

  def show
    @farmers_market = FarmersMarket.find(params[:id])
  end

  def new
  end

  def create
    farmers_market = FarmersMarket.create(name: params[:name], city: params[:city], num_stands: params[:num_stands], open: params[:open])
    redirect_to "/farmers_markets"
  end

end
