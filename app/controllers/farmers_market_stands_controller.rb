class FarmersMarketStandsController < ApplicationController
  def index
    @farmers_market = FarmersMarket.find(params[:id])
    @stands = @farmers_market.stands
  end
end
