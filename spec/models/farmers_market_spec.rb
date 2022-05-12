require 'rails_helper'

RSpec.describe FarmersMarket, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :city }
    it { should allow_value(true).for :open}
    it { should allow_value(false).for :open}
    it { should_not allow_value(nil).for :open}
    it { should validate_presence_of :num_stands }
  end

  describe 'relationships' do
    it {should have_many :stands}
  end
end
