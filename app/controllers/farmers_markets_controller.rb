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
    farmers_market = FarmersMarket.create(farmers_market_params)
    redirect_to "/farmers_markets"
  end


  def edit
    @farmers_market = FarmersMarket.find(params[:id])
  end

  def update
    farmers_market = FarmersMarket.find(params[:id])
    farmers_market.update(farmers_market_params)
    redirect_to "/farmers_markets/#{farmers_market.id}"
  end

private

  def farmers_market_params #strong parameters
    params.permit(:name, :city, :num_stands, :open)
  end

end
