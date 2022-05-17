class FarmersMarket < ApplicationRecord
  has_many :stands, dependent: :delete_all
  #this creates a method that allows us to call (.stands)
  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :num_stands
  validates_inclusion_of :open, :in => [true, false]

  def self.ordered_by_creation
    order(created_at: :desc)
  end

  def formatted_created_at
    created_at.strftime('%m/%d/%Y %H:%M %p')
  end

  def count_of_stands
    stands.count
  end

end
