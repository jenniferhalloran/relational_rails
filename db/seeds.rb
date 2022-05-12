# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@slo = FarmersMarket.create!(name: "SLO Farmers Market", city: "San Luis Obispo", open: false, num_stands: 15)
@bubbas = @slo.stands.create!(name: "Bubbas Burritos", open: true, review_rating: 4)
@espresso_lane = @slo.stands.create!(name: "Espresso Lane", open: true, review_rating: 5)
