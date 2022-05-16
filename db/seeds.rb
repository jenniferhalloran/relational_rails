# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Stand.destroy_all
FarmersMarket.destroy_all

slo =FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: true, num_stands: 15)
hillcrest = FarmersMarket.create!(name: "Hillcrest Farmers Market", city: "San Diego", open: true, num_stands: 46)
ferry_plaza = FarmersMarket.create!(name: "Ferry Plaza Farmers Market", city: "San Francisco", open: false , num_stands: 25)
greenmarket = FarmersMarket.create!(name: "Union Square Greenmarket", city: "New York", open: true , num_stands: 87)
# pike = FarmersMarket.create!(name: "Pike Place", city: "Seattle", open: true , num_stands: 50)
# night_market = FarmersMarket.create!(name: "Saturday Night Market", city: "Chiang Mai", open: false , num_stands: 112)
# islip = FarmersMarket.create!(name: "Islip Farmers Market", city: "Islip", open: true , num_stands: 11 )


#slo
slo.stands.create!(name: "Bubbas Burritos", open: true, review_rating: 4)
slo.stands.create!(name: "Espresso Lane", open: true, review_rating: 5)
slo.stands.create!(name: "Miss Maples", open: true, review_rating: 2)
slo.stands.create!(name: "Mystic Pizza", open: false, review_rating: 3 )
slo.stands.create!(name: "Callahan Ceramics", open: true, review_rating: 4 )

#Hillcrest
hillcrest.stands.create!(name: "Tasty Truck", open: true, review_rating: 1)
hillcrest.stands.create!(name: "Breakfast Bistro", open: false, review_rating: 4)
hillcrest.stands.create!(name: "Sweet Treats", open: true, review_rating: 5)
hillcrest.stands.create!(name: "The Mad Griddle", open: true, review_rating: 4)
hillcrest.stands.create!(name: "Lumberjack Smokehouse", open: true, review_rating: 3)

#ferry_plaza
ferry_plaza.stands.create!(name: "Chicky Chimichanga ", open: true, review_rating: 3)
ferry_plaza.stands.create!(name: "The Bun Bus", open: true, review_rating: 5)

#greenmarket
greenmarket.stands.create!(name: "The Food Dude", open: true, review_rating: 2)
greenmarket.stands.create!(name: "Twisted Toaster", open: true, review_rating: 5)
greenmarket.stands.create!(name: "Sunrise Scrambles", open: false, review_rating: 4)
