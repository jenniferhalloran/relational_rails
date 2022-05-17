require 'rails_helper'


# User Story 13, Parent Child Creation
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
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
