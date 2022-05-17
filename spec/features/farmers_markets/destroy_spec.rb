require 'rails_helper'

RSpec.describe 'destroy a farmers market' do
  before (:each) do
    @farmers_market_1 = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, num_stands: 15)
    @farmers_market_2 = FarmersMarket.create!(name: "Hillcrest Farmers Market", city: "San Diego", open: true, num_stands: 46)
    @farmers_market_3 = FarmersMarket.create!(name: "Ferry Plaza Farmers Market", city: "San Francisco", open: true, num_stands: 66)
    @farmers_market_4 = FarmersMarket.create!(name: "Union Square Greenmarket", city: "New York", open: true, num_stands: 80)
  end

	it 'deletes the farmers market from the index page' do
   		visit "/farmers_markets/#{@farmers_market_1.id}"
   		click_link "Delete #{@farmers_market_1.name}"

   		expect(current_path).to eq('/farmers_markets')
   		expect(page).to_not have_content(@farmers_market_1.name)
   		expect(page).to have_content(@farmers_market_2.name)
   		expect(page).to have_content(@farmers_market_3.name)
   		expect(page).to have_content(@farmers_market_4.name)

	end

end
