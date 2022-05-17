class FarmersMarketStandsController < ApplicationController
  def index
    @farmers_market = FarmersMarket.find(params[:id])
    if params[:sort] == "name"
      @stands = @farmers_market.stands.order(:name)
    elsif params[:rating_over]
      @stands = @farmers_market.stands.rating_over(params[:rating_over])
    else
      @stands = @farmers_market.stands
    end

  end
end
