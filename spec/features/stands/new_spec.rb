require 'rails_helper'

RSpec.describe 'the stand edit' do
  before (:each) do
    @farmers_market_1 = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, num_stands: 15)
  end


  it "links to the stand edit page" do
    visit "/farmers_markets/#{@farmers_market_1.id}/stands"
    click_link "Create Stand"

    expect(current_path).to eq("/farmers_markets/#{@farmers_market_1.id}/stands/new")
  end


  it "can create new stand" do
    visit "/farmers_markets/#{@farmers_market_1.id}/stands/new"

    fill_in('Name', with: 'Callahan Ceramics')
    fill_in('Review rating', with: 4)
    select "true", from: :open
    click_button('Create Stand')

    expect(current_path).to eq("/farmers_markets/#{@farmers_market_1.id}/stands")
    expect(page).to have_content("Callahan Ceramics")
  end
end
