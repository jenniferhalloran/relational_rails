require 'rails_helper'

RSpec.describe 'the farmers markets show page' do
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

  it 'displays the farmers markets attributes' do
    farmers_market = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, stands: 21)

    visit "/farmers_markets/#{farmers_market.id}"
    expect(page).to have_content(farmers_market.name)
  end

end
