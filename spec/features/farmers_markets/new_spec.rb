require 'rails_helper'

# User Story 11, Parent Creation
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

RSpec.describe 'the Farmers Market creation', type: :feature do
  it 'links to the new page from the farmers markets index' do
    visit '/farmers_markets'

    click_link('New Farmers Market')
    expect(current_path).to eq('/farmers_markets/new')
  end

  it 'can create a new Farmers Market' do
    visit '/farmers_markets/new'

    fill_in('Name', with: 'Pike Place Market')
    fill_in('City', with: 'Seattle')
    fill_in('Number of Stands', with: 24)
    select "true", from: :open
    click_button('Create Farmers Market')

    expect(current_path).to eq("/farmers_markets")
    expect(page).to have_content("Pike Place Market")
  end

end
