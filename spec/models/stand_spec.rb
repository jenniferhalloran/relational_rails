require 'rails_helper'

RSpec.describe Stand, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :review_rating}
    it { should allow_value(true).for :open}
    it { should allow_value(false).for :open}
    it { should_not allow_value(nil).for :open}
  end

  describe 'relationships' do
    it {should belong_to :farmers_market}
  end
end
