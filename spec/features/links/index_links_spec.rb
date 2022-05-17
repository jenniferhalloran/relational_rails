require 'rails_helper'

RSpec.describe 'links to indexes on every page' do
  before (:each) do
    @farmers_market_1 = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, num_stands: 15)
    @farmers_market_2 = FarmersMarket.create!(name: "Hillcrest Farmers Market", city: "San Diego", open: true, num_stands: 46)
    @stand_1 = Stand.create!(name: "Bubbas Burritos", open: true, review_rating: 4, farmers_market_id: @farmers_market_1.id)
    @stand_2 = Stand.create!(name: "Espresso Lane", open: true, review_rating: 5, farmers_market_id: @farmers_market_1.id)

    @views = ["/farmers_markets", "/farmers_markets/#{@farmers_market_1.id}", "/farmers_markets/#{@farmers_market_2.id}", "/stands",
              "/stands/#{@stand_1.id}", "/stands/#{@stand_2.id}", "/farmers_markets/#{@farmers_market_1.id}/stands", "/farmers_markets/#{@farmers_market_2.id}/stands"]
  end

  # User Story 8, Child Index Link
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it 'has a link to the stands index on every view page' do
    @views.each do |view|
      visit view

      expect(page).to have_link('All Stands')

      click_link('All Stands')

      expect(current_path).to eq('/stands')
    end
  end

  # User Story 9, Parent Index Link
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index
  it 'has a link to the farmers markets index on every view page' do
    @views.each do |view|
      visit view

      expect(page).to have_link('All Farmers Markets')
      click_link('All Farmers Markets')
      expect(current_path).to eq('/farmers_markets')
    end
  end

  # User Story 10, Parent Child Index Link
  # As a visitor
  # When I visit a parent show page ('/parents/:id')
  # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
  it 'has a link on each farmers market show page to that markets specific stalls' do
    visit "/farmers_markets/#{@farmers_market_1.id}"
    expect(page).to have_link("Current Stands")
    click_link("Current Stands")
    expect(current_path).to eq("/farmers_markets/#{@farmers_market_1.id}/stands")

    visit "/farmers_markets/#{@farmers_market_2.id}"
    expect(page).to have_link("Current Stands")
    click_link("Current Stands")
    expect(current_path).to eq("/farmers_markets/#{@farmers_market_2.id}/stands")
  end
end
