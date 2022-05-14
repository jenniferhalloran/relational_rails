class StandsController < ApplicationController
  def index
    @stands = Stand.all
  end

  def show
    @stand = Stand.find(params[:id])
  end

  def new
    @farmers_market = FarmersMarket.find(params[:id])
  end

  def create
    @farmers_market = FarmersMarket.find(params[:id])
    @stand = @farmers_market.stands.create!(stand_params)
    redirect_to "/farmers_markets/#{@farmers_market.id}/stands"
  end

private
  def stand_params
    params.permit(:name, :open, :review_rating)
  end

end
