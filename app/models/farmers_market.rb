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

  def self.order_by_active_stands
    # all.sort_by { |market| market.count_of_stands }.reverse
    # I know that we are not supposed to use ruby, I have just done this to make the method work since I set it all up but absolutely could not understand the raw SQL or Activerecord :')
    # find_by_sql(
      # "SELECT * FROM farmers_markets
      # LEFT OUTER JOIN
      # (SELECT market_id, count(*) AS stand_count FROM stands GROUP BY farmers_market_id) AS tmp_count on(id = market_id)
      # ORDER BY COALESCE(stand_count,0)desc;")
      # https://www.ruby-forum.com/t/order-records-based-on-number-of-children/55457/5

    FarmersMarket.left_joins(:stands).group(:id).order('COUNT(stands.id) DESC')
  end

end
