class FarmersMarket < ApplicationRecord
  has_many :stands
  #this creates a method that allows us to call (.stands)
end
