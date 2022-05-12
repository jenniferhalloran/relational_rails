require 'rails_helper'

RSpec.describe FarmersMarket, type: :model do
  it {should have_many :stands}
end
