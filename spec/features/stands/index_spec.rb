require 'rails_helper'

RSpec.describe 'the stands index page', type: :feature do
  before (:each) do
    @farmers_market_1 = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, num_stands: 15)
    @farmers_market_2 = FarmersMarket.create!(name: "Hillcrest Farmers Market", city: "San Diego", open: true, num_stands: 46)
    @stand_1 = Stand.create!(name: "Bubbas Burritos", open: true, review_rating: 4, farmers_market_id: @farmers_market_1.id)
    @stand_2 = Stand.create!(name: "Espresso Lane", open: true, review_rating: 5, farmers_market_id: @farmers_market_1.id)
    @stand_3 = Stand.create!(name: "Miss Maples", open: true, review_rating: 5, farmers_market_id: @farmers_market_2.id)
    @stand_4 = Stand.create!(name: "Mystic Pizza", open: false, review_rating: 3, farmers_market_id: @farmers_market_2.id)
  end

  # User Story 3, Child Index
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:

  # User Story 15, Child Index only shows `true` Records
  # As a visitor
  # When I visit the child index
  # Then I only see records where the boolean column is `true`

  it 'displays the stands and each name, open status, and review rating ' do
    visit '/stands'
    expect(page).to have_content(@stand_1.name)
    expect(page).to have_content(@stand_1.open)
    expect(page).to have_content(@stand_1.review_rating)
    expect(page).to have_content(@stand_2.name)
    expect(page).to have_content(@stand_2.open)
    expect(page).to have_content(@stand_2.review_rating)
    expect(page).to have_content(@stand_3.name)
    expect(page).to have_content(@stand_3.open)
    expect(page).to have_content(@stand_3.review_rating)
    expect(page).to_not have_content(@stand_4.name)
    expect(page).to_not have_content(@stand_4.open)
    expect(page).to_not have_content(@stand_4.review_rating)
  end

  # User Story 18, Child Update From Childs Index Page
  # As a visitor
  # When I visit the `child_table_name` index page or a parent `child_table_name` index page
  # Next to every child, I see a link to edit that child's info
  # When I click the link
  # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11

    it "has a link to edit each stall's information" do

    end

end
