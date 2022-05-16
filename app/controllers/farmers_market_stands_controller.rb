class FarmersMarketStandsController < ApplicationController
  def index
    @farmers_market = FarmersMarket.find(params[:id])
    @stands = @farmers_market.stands
    if params[:sort] == "name"
      @stands = @farmers_market.stands.order(:name)
    end
    
  end
end
