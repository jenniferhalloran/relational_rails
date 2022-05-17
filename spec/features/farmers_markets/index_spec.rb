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
  it 'displays the farmers market names and created at information' do
    visit '/farmers_markets'
    expect(page).to have_content(@farmers_market_1.name)
    expect(page).to have_content(@farmers_market_1.formatted_created_at)
    expect(page).to have_content(@farmers_market_2.name)
    expect(page).to have_content(@farmers_market_2.formatted_created_at)
    expect(page).to have_content(@farmers_market_3.name)
    expect(page).to have_content(@farmers_market_3.formatted_created_at)
    expect(page).to have_content(@farmers_market_4.name)
    expect(page).to have_content(@farmers_market_4.formatted_created_at)
  end

  # User Story 6, Parent Index sorted by Most Recently Created
  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created

  it 'shows all the farmers markets in order of created_at, most recent first' do
    visit '/farmers_markets'
    expect(@farmers_market_4.name).to appear_before(@farmers_market_3.name)
    expect(@farmers_market_3.name).to appear_before(@farmers_market_2.name)
    expect(@farmers_market_2.name).to appear_before(@farmers_market_1.name)
    expect(@farmers_market_2.name).not_to appear_before(@farmers_market_4.name)
  end

# User Story 17, Parent Update From Parent Index Page
# As a visitor
# When I visit the parent index page
# Next to every parent, I see a link to edit that parent's info
# When I click the link
# I should be taken to that parents edit page where I can update its information just like in User Story 4

  it "has a link to edit each market's information" do
    FarmersMarket.all.each do |farmers_market|
      visit '/farmers_markets'
      within ".farmers_market-#{farmers_market.id}" do
        expect(page).to have_link("Edit")
        click_link("Edit")
        expect(current_path).to eq("/farmers_markets/#{farmers_market.id}/edit")
      end
    end
  end


# User Story 22, Parent Delete From Parent Index Page
# As a visitor
# When I visit the parent index page
# Next to every parent, I see a link to delete that parent
# When I click the link
# I am returned to the Parent Index Page where I no longer see that parent




end
