require 'rails_helper'

RSpec.describe FarmersMarket, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should validate_presence_of :num_stands }
    it { should allow_value(true).for :open}
    it { should allow_value(false).for :open}
    it { should_not allow_value(nil).for :open}
  end

  describe 'relationships' do
    it {should have_many :stands}
  end

  describe 'class methods' do
    before (:each) do
      @slo =FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: true, num_stands: 15)
      @hillcrest = FarmersMarket.create!(name: "Hillcrest Farmers Market", city: "San Diego", open: true, num_stands: 46)
      @ferry_plaza = FarmersMarket.create!(name: "Ferry Plaza Farmers Market", city: "San Francisco", open: false , num_stands: 25)
      @greenmarket = FarmersMarket.create!(name: "Union Square Greenmarket", city: "New York", open: true , num_stands: 87)
    end
    it "orders by creation time" do
      expect(FarmersMarket.ordered_by_creation).to eq([@greenmarket, @ferry_plaza, @hillcrest, @slo])
    end
  end

end
