require 'rails_helper'

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
