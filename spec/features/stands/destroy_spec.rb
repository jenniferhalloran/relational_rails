require 'rails_helper'

RSpec.describe 'destroy a stall' do
  before (:each) do
    @farmers_market_1 = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, num_stands: 15)
    @farmers_market_2 = FarmersMarket.create!(name: "Hillcrest Farmers Market", city: "San Diego", open: true, num_stands: 46)
    @stand_1 = Stand.create!(name: "Bubbas Burritos", open: true, review_rating: 4, farmers_market_id: @farmers_market_1.id)
    @stand_2 = Stand.create!(name: "Espresso Lane", open: true, review_rating: 5, farmers_market_id: @farmers_market_1.id)
    @stand_3 = Stand.create!(name: "Miss Maples", open: true, review_rating: 5, farmers_market_id: @farmers_market_2.id)
    @stand_4 = Stand.create!(name: "Mystic Pizza", open: true, review_rating: 3, farmers_market_id: @farmers_market_2.id)
  end

	it 'deletes the stall from the index page' do

   		visit "/stands/#{@stand_1.id}"

   		click_link "Delete #{@stand_1.name}"
   		expect(current_path).to eq('/stands')
   		expect(page).to_not have_content(@stand_1.name)
   		expect(page).to have_content(@stand_2.name)
   		expect(page).to have_content(@stand_3.name)
   		expect(page).to have_content(@stand_4.name)

	end

end
