class Stand < ApplicationRecord
  belongs_to :farmers_market
  #this allows us to call a method to see the farmers market (.farmers_market)
  validates_presence_of :name
  validates_presence_of :review_rating
  validates_inclusion_of :open, :in => [true, false]


  def self.rating_over(rating)
    where("review_rating > ?", rating)
  end

end
