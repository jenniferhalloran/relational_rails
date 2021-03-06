require 'rails_helper'

RSpec.describe Stand, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :review_rating}
    it { should allow_values(true, false).for :open}
    it { should_not allow_value(nil).for :open}
  end

  describe 'relationships' do
    it {should belong_to :farmers_market}
  end

  describe 'class methods' do
    before (:each) do
      @slo =FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: true, num_stands: 15)
      @hillcrest = FarmersMarket.create!(name: "Hillcrest Farmers Market", city: "San Diego", open: true, num_stands: 46)
      @bubs = @slo.stands.create!(name: "Bubbas Burritos", open: true, review_rating: 4)
      @espresso = @slo.stands.create!(name: "Espresso Lane", open: true, review_rating: 5)
      @truck = @hillcrest.stands.create!(name: "Tasty Truck", open: true, review_rating: 1)
      @bistro = @hillcrest.stands.create!(name: "Breakfast Bistro", open: false, review_rating: 4)
    end


    it "lists the open stands" do
      expect(Stand.open_stands).to eq([@bubs, @espresso, @truck])
    end


    it "can alphabetize the stands" do
      expect(Stand.alphabetize).to eq([@bistro, @bubs, @espresso, @truck])
    end


    it "can list stands with a review rating over a certain number" do
      expect(Stand.rating_over(2)).to eq([@bubs, @espresso, @bistro])
      expect(Stand.rating_over(4)).to eq([@espresso])
    end
  end
end
