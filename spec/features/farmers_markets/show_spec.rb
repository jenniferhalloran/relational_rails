require 'rails_helper'

RSpec.describe 'the farmers markets show page', type: :feature do
  before (:each) do
    @farmers_market_1 = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, num_stands: 15)
    @farmers_market_2 = FarmersMarket.create!(name: "Hillcrest Farmers Market", city: "San Diego", open: true, num_stands: 46)
    @farmers_market_3 = FarmersMarket.create!(name: "Ferry Plaza Farmers Market", city: "San Francisco", open: true, num_stands: 66)
    @farmers_market_4 = FarmersMarket.create!(name: "Union Square Greenmarket", city: "New York", open: true, num_stands: 80)
    @stand_1 = Stand.create!(name: "Bubbas Burritos", open: true, review_rating: 4, farmers_market_id: @farmers_market_1.id)
    @stand_2 = Stand.create!(name: "Espresso Lane", open: true, review_rating: 5, farmers_market_id: @farmers_market_1.id)
  end


  it 'displays the specific farmers markets attributes' do
    visit "/farmers_markets/#{@farmers_market_1.id}"

    expect(page).to have_content(@farmers_market_1.name)
    expect(page).to have_content(@farmers_market_1.city)
    expect(page).to have_content(@farmers_market_1.open)
    expect(page).to have_content(@farmers_market_1.num_stands)
    expect(page).to_not have_content(@farmers_market_2.num_stands)
    expect(page).to_not have_content(@farmers_market_2.name)
    expect(page).to_not have_content(@farmers_market_3.name)
    expect(page).to_not have_content(@farmers_market_4.name)
  end


  it 'displays the number of stands associated with this farmers market' do
    visit "/farmers_markets/#{@farmers_market_1.id}"

    expect(page).to have_content(@farmers_market_1.count_of_stands)
  end

  it "links to the stands associated with this farmers market" do
    visit "/farmers_markets/#{@farmers_market_1.id}"
    click_link 'Current Stands'

    expect(current_path).to eq("/farmers_markets/#{@farmers_market_1.id}/stands")
  end


  it "links to delete the team" do
    visit "/farmers_markets/#{@farmers_market_1.id}"
    click_link "Delete #{@farmers_market_1.name}"

    expect(current_path).to eq('/farmers_markets')
    expect(page).not_to have_content("SLO Farmers Market")
    expect(page).to have_content("Union Square Greenmarket")

    visit "/stands"

    expect(page).not_to have_content("Bubbas Burritos")
    expect(page).not_to have_content("Espresso Lane")
  end
end
