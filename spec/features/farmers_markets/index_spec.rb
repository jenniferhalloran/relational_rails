require 'rails_helper'

RSpec.describe 'the farmers markets index page', type: :feature do
  before (:each) do
    @farmers_market_1 = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, num_stands: 15)
    @farmers_market_2 = FarmersMarket.create!(name: "Hillcrest Farmers Market", city: "San Diego", open: true, num_stands: 46)
    @farmers_market_3 = FarmersMarket.create!(name: "Ferry Plaza Farmers Market", city: "San Francisco", open: true, num_stands: 66)
    @farmers_market_4 = FarmersMarket.create!(name: "Union Square Greenmarket", city: "New York", open: true, num_stands: 80)
  end

  # User Story 1, Parent Index
  # For each parent table
  # As a visitor
  # When I visit '/parents' (/farmers_markets)
  # Then I see the name of each parent record in the system
  it 'displays the farmers markets' do
    visit '/farmers_markets'
    save_and_open_page
    expect(page).to have_content(@farmers_market_1.name)
    expect(page).to have_content(@farmers_market_2.name)
    expect(page).to have_content(@farmers_market_3.name)
    expect(page).to have_content(@farmers_market_4.name)
  end

end
