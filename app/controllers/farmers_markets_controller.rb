class FarmersMarketsController < ApplicationController
  def index
    @farmers_markets = FarmersMarket.all
  end
end
