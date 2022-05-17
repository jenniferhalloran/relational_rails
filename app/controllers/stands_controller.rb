class StandsController < ApplicationController
  def index
    @stands = Stand.open_stands
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

  def edit
    @stand = Stand.find(params[:id])
  end

  def update
    stand = Stand.find(params[:id])
    stand.update(stand_params)
    redirect_to "/stands/#{stand.id}"
  end

  def destroy
    stand = Stand.find(params[:id])
    stand.destroy
    redirect_to('/stands')
  end

private

  def stand_params
    params.permit(:name, :open, :review_rating)
  end

end
