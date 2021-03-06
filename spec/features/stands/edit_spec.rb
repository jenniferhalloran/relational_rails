require 'rails_helper'

RSpec.describe 'the stand edit page' do
  before (:each) do
    @farmers_market_1 = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, num_stands: 15)
    @farmers_market_2 = FarmersMarket.create!(name: "Hillcrest Farmers Market", city: "San Diego", open: true, num_stands: 46)
    @stand_1 = Stand.create!(name: "Bubbas Burritos", open: true, review_rating: 4, farmers_market_id: @farmers_market_1.id)
    @stand_2 = Stand.create!(name: "Espresso Lane", open: true, review_rating: 5, farmers_market_id: @farmers_market_1.id)
    @stand_3 = Stand.create!(name: "Miss Maples", open: true, review_rating: 5, farmers_market_id: @farmers_market_2.id)
  end


  it "links to the stand edit page" do
    visit "/stands/#{@stand_1.id}"
    click_link "Update #{@stand_1.name}"

    expect(current_path).to eq("/stands/#{@stand_1.id}/edit")
  end


  it "can edit the farmers market" do
    visit "/stands/#{@stand_1.id}"

    expect(page).to have_content("true")
    expect(page).to_not have_content("false")
    expect(page).to have_content("Bubbas Burritos")
    expect(page).to have_content(4)

    visit "/stands/#{@stand_1.id}/edit"

    fill_in('Name', with: 'Bubbas Burritos')
    fill_in('Review rating', with: 4)
    select "false", from: :open
    click_button('Update Stand')

    expect(current_path).to eq("/stands/#{@stand_1.id}")
    expect(page).to have_content("false")
    expect(page).to_not have_content("true")
    expect(page).to have_content("Bubbas Burritos")
    expect(page).to have_content(4)
  end
end
