require 'rails_helper'

RSpec.describe Stand, type: :model do
  it {should belong_to :farmers_market}
end
