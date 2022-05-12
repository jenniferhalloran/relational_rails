require 'rails_helper'

RSpec.describe 'the farmers markets show page', type: :feature do
  before (:each) do
    @farmers_market_1 = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, num_stands: 15)
    @farmers_market_2 = FarmersMarket.create!(name: "Hillcrest Farmers Market", city: "San Diego", open: true, num_stands: 46)
    @farmers_market_3 = FarmersMarket.create!(name: "Ferry Plaza Farmers Market", city: "San Francisco", open: true, num_stands: 66)
    @farmers_market_4 = FarmersMarket.create!(name: "Union Square Greenmarket", city: "New York", open: true, num_stands: 80)
  end

# User Story 2, Parent Show
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

  it 'displays the specific farmers markets attributes' do
    visit "/farmers_markets/#{@farmers_market_1.id}"
  
    expect(page).to have_content(@farmers_market_1.name)
    expect(page).to have_content(@farmers_market_1.city)
    expect(page).to have_content(@farmers_market_1.open)
    expect(page).to have_content(@farmers_market_1.num_stands)
    expect(page).to_not have_content(@farmers_market_2.num_stands)

  end
end
