require 'rails_helper'

# User Story 5, Farmers Market's Stands Index
# As a visitor
# When I visit '/farmers_markets/:farmers_market_id/stands'
# Then I see each Stand that is associated with that Farmers Market with each Stand's attributes:

RSpec.describe 'Farmers Markets stands index' do
  before (:each) do
    @slo = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, num_stands: 15)
    @bubbas = @slo.stands.create!(name: "Bubbas Burritos", open: true, review_rating: 4)
    @espresso_lane = @slo.stands.create!(name: "Espresso Lane", open: true, review_rating: 5)
  end

  it 'shows all of the stand names, open status and rating for the farmers market' do
    visit "/farmers_markets/#{@slo.id}/stands"
    expect(page).to have_content(@bubbas.name)
    expect(page).to have_content(@espresso_lane.name)
  end

  it 'links to each farmers market stand' do
    visit "/farmers_markets/#{@slo.id}/stands"
    click_on @bubbas.name
    expect(current_path).to eq("/stands/#{@bubbas.id}")
  end

end
