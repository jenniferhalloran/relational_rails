require 'rails_helper'

RSpec.describe 'the farmers market edit' do
  before (:each) do
    @farmers_market_1 = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, num_stands: 15)
  end


  it "links to the edit page" do
    visit "/farmers_markets/#{@farmers_market_1.id}"

    click_link "Update #{@farmers_market_1.name}"
    expect(current_path).to eq("/farmers_markets/#{@farmers_market_1.id}/edit")
  end


  it "can edit the farmers market" do
    visit "/farmers_markets/#{@farmers_market_1.id}"
    expect(page).to have_content("SLO Farmers Market")
    expect(page).to have_content("San Luis Obispo")
    expect(page).to have_content(15)
    expect(page).to have_content("false")
    expect(page).to_not have_content("true")

    visit "/farmers_markets/#{@farmers_market_1.id}/edit"

    fill_in('Name', with: 'SLO Farmers Market')
    fill_in('City', with: 'San Luis Obispo')
    fill_in('Number of Stands', with: 15)
    select "true", from: :open
    click_button('Update Farmers Market')

    expect(current_path).to eq("/farmers_markets/#{@farmers_market_1.id}")
    expect(page).to have_content("SLO Farmers Market")
    expect(page).to have_content("San Luis Obispo")
    expect(page).to have_content(15)
    expect(page).to have_content("true")
    expect(page).to_not have_content("false")
  end
end
