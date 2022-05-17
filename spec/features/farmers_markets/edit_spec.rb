require 'rails_helper'


# User Story 12, Parent Update
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

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
    expect(page).to have_content("false")

    visit "/farmers_markets/#{@farmers_market_1.id}/edit"

    fill_in('Name', with: 'SLO Farmers Market')
    fill_in('City', with: 'San Luis Obispo')
    fill_in('Number of Stands', with: 15)
    select "true", from: :open
    click_button('Update Farmers Market')

    expect(current_path).to eq("/farmers_markets/#{@farmers_market_1.id}")
    expect(page).to have_content("true")

  end
end
