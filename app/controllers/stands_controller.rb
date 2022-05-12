class StandsController < ApplicationController
  def index
    @stands = Stand.all
  end

  def show
    @stand = Stand.find(params[:id])
  end

end
