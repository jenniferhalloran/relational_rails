class FarmersMarket < ApplicationRecord
  has_many :stands
  #this creates a method that allows us to call (.stands)
  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :num_stands
  validates_inclusion_of :open, :in => [true, false]
end
