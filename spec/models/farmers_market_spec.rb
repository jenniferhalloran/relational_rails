require 'rails_helper'

RSpec.describe FarmersMarket, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should validate_presence_of :num_stands }
    it { should allow_values(true, false).for :open}
    it { should_not allow_value(nil).for :open}
  end

  describe 'relationships' do
    it {should have_many :stands}
  end

  describe 'class methods' do
    before (:each) do
      @hillcrest = FarmersMarket.create!(name: "Hillcrest Farmers Market", city: "San Diego", open: true, num_stands: 46)
      @slo =FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: true, num_stands: 15)
      @greenmarket = FarmersMarket.create!(name: "Union Square Greenmarket", city: "New York", open: true , num_stands: 87)
      @ferry_plaza = FarmersMarket.create!(name: "Ferry Plaza Farmers Market", city: "San Francisco", open: false , num_stands: 25)
      @espresso = @slo.stands.create!(name: "Espresso Lane", open: true, review_rating: 5)
      @callahan = @slo.stands.create!(name: "Callahan Ceramics", open: true, review_rating: 4 )
      @griddle = @hillcrest.stands.create!(name: "The Mad Griddle", open: true, review_rating: 4)
      @truck = @hillcrest.stands.create!(name: "Tasty Truck", open: true, review_rating: 1)
      @bistro = @hillcrest.stands.create!(name: "Breakfast Bistro", open: false, review_rating: 4)
      @chicky = @ferry_plaza.stands.create!(name: "Chicky Chimichanga ", open: true, review_rating: 3)
    end


    it "orders by creation time" do
      expect(FarmersMarket.ordered_by_creation).to eq([@ferry_plaza, @greenmarket, @slo, @hillcrest])
    end


    it "can order by number of stands" do
      expect(FarmersMarket.order_by_active_stands).to eq([@hillcrest, @slo, @ferry_plaza, @greenmarket])
    end
  end

  describe 'instance methods' do
    before (:each) do
      @slo =FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: true, num_stands: 15)
      @hillcrest = FarmersMarket.create!(name: "Hillcrest Farmers Market", city: "San Diego", open: true, num_stands: 46)
      @bubbas = @slo.stands.create!(name: "Bubbas Burritos", open: true, review_rating: 4)
      @espresso = @slo.stands.create!(name: "Espresso Lane", open: true, review_rating: 5)
    end


    it "returns a formatted created at date" do
      date = Time.now.utc
      expect(@slo.formatted_created_at).to eq(date.strftime('%m/%d/%Y %H:%M %p'))
    end


    it "returns the count of stands for a farmers market" do
      expect(@slo.count_of_stands). to eq(2)
      expect(@hillcrest.count_of_stands). to eq(0)
    end
  end
end
