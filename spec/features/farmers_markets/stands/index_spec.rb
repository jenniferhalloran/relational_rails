require 'rails_helper'

RSpec.describe 'Farmers Markets stands index' do
  before (:each) do
    @slo = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, num_stands: 15)
    @espresso_lane = @slo.stands.create!(name: "Espresso Lane", open: true, review_rating: 5)
    @bubbas = @slo.stands.create!(name: "Bubbas Burritos", open: true, review_rating: 4)
    @maples = @slo.stands.create!(name: "Miss Maples", open: true, review_rating: 2)
  end


  it 'shows all of the stand names, open status and rating for the farmers market' do
    visit "/farmers_markets/#{@slo.id}/stands"

    expect(page).to have_content(@bubbas.name)
    expect(page).to have_content(@bubbas.open)
    expect(page).to have_content(@bubbas.review_rating)
    expect(page).to have_content(@espresso_lane.name)
    expect(page).to have_content(@espresso_lane.open)
    expect(page).to have_content(@espresso_lane.review_rating)
    expect(page).to have_content(@maples.name)
    expect(page).to have_content(@maples.open)
    expect(page).to have_content(@maples.review_rating)
  end


  it 'links to each farmers market stand' do
    visit "/farmers_markets/#{@slo.id}/stands"
    click_on @bubbas.name

    expect(current_path).to eq("/stands/#{@bubbas.id}")
  end


  it "links to a page to sort stands in alphabetical order" do
    visit "/farmers_markets/#{@slo.id}/stands"

    expect(@espresso_lane.name).to appear_before(@bubbas.name)
    expect(@bubbas.name).to appear_before(@maples.name)

    click_on "Alphabetize"

    expect(current_path).to eq("/farmers_markets/#{@slo.id}/stands/")
    expect(@bubbas.name).to appear_before(@espresso_lane.name)
    expect(@espresso_lane.name).to appear_before(@maples.name)
  end


  it "has a link to edit each stall's information" do
      Stand.open_stands.each do |stand|
        visit '/stands'

        within ".stand-#{stand.id}" do
          expect(page).to have_link("Edit")
          click_link("Edit")
          expect(current_path).to eq("/stands/#{stand.id}/edit")
        end
      end
    end


  it "can return stalls with a rating over a certain threshold" do
    visit "/farmers_markets/#{@slo.id}/stands"
    fill_in "Find stands with rating over:", with: "3"
    click_on "Search"

    expect(current_path).to eq("/farmers_markets/#{@slo.id}/stands")
    expect(page).to have_content(@espresso_lane.name)
    expect(page).to have_content(@bubbas.name)
    expect(page).to_not have_content(@maples.name)

    visit "/farmers_markets/#{@slo.id}/stands"
    fill_in "Find stands with rating over:", with: "4"
    click_on "Search"

    expect(current_path).to eq("/farmers_markets/#{@slo.id}/stands")
    expect(page).to have_content(@espresso_lane.name)
    expect(page).to_not have_content(@bubbas.name)
    expect(page).to_not have_content(@maples.name)
  end
end
