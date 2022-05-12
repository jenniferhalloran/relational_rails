class StandsController < ApplicationController
  def index
    @stands = Stand.all
  end

end
