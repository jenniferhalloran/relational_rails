require 'rails_helper'

RSpec.describe 'the farmers markets index page', type: :feature do
  before (:each) do
    @farmers_market_1 = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, num_stands: 15)
    @farmers_market_2 = FarmersMarket.create!(name: "Hillcrest Farmers Market", city: "San Diego", open: true, num_stands: 46)
    @farmers_market_3 = FarmersMarket.create!(name: "Ferry Plaza Farmers Market", city: "San Francisco", open: true, num_stands: 66)
    @farmers_market_4 = FarmersMarket.create!(name: "Union Square Greenmarket", city: "New York", open: true, num_stands: 80)
    @espresso = @farmers_market_1.stands.create!(name: "Espresso Lane", open: true, review_rating: 5)
    @callahan = @farmers_market_1.stands.create!(name: "Callahan Ceramics", open: true, review_rating: 4 )
    @griddle = @farmers_market_2.stands.create!(name: "The Mad Griddle", open: true, review_rating: 4)
    @truck = @farmers_market_2.stands.create!(name: "Tasty Truck", open: true, review_rating: 1)
    @bistro = @farmers_market_2.stands.create!(name: "Breakfast Bistro", open: false, review_rating: 4)
    @chicky = @farmers_market_3.stands.create!(name: "Chicky Chimichanga ", open: true, review_rating: 3)
  end

  it 'displays the farmers market names and created at information' do
    visit '/farmers_markets'

    expect(page).to have_content(@farmers_market_1.name)
    expect(page).to have_content(@farmers_market_1.formatted_created_at)
    expect(page).to have_content(@farmers_market_1.count_of_stands)
    expect(page).to have_content(@farmers_market_2.name)
    expect(page).to have_content(@farmers_market_2.formatted_created_at)
    expect(page).to have_content(@farmers_market_3.name)
    expect(page).to have_content(@farmers_market_3.formatted_created_at)
    expect(page).to have_content(@farmers_market_4.name)
    expect(page).to have_content(@farmers_market_4.formatted_created_at)
  end


  it 'shows all the farmers markets in order of created_at, most recent first' do
    visit '/farmers_markets'

    expect(@farmers_market_4.name).to appear_before(@farmers_market_3.name)
    expect(@farmers_market_3.name).to appear_before(@farmers_market_2.name)
    expect(@farmers_market_2.name).to appear_before(@farmers_market_1.name)
    expect(@farmers_market_2.name).not_to appear_before(@farmers_market_4.name)
  end


  it "has a link to reorder markets by number of stands" do
    visit '/farmers_markets'
    expect(page). to have_link("Sort Markets by Number of Stands")
  end


  it "can show markets ordered by number of stands when link is clicked" do
    visit '/farmers_markets'
    click_link("Sort Markets by Number of Stands")

    expect(@farmers_market_2.name).to appear_before(@farmers_market_1.name)
    expect(@farmers_market_1.name).to appear_before(@farmers_market_3.name)
    expect(@farmers_market_3.name).to appear_before(@farmers_market_4.name)
  end


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


  it "has a link to delete each market's information" do
    FarmersMarket.all.each do |farmers_market|
      visit '/farmers_markets'

      within ".farmers_market-#{farmers_market.id}" do
        expect(page).to have_link("Delete")
        click_link("Delete")
        expect(current_path).to eq("/farmers_markets")
      end
    end
  end
end
