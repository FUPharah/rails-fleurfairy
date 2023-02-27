# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = nil
5.times do
  email = Faker::Internet.email
  user = User.new(email: email)
end

5.times do
  title = Faker::Games::WorldOfWarcraft.hero
  description = Faker::Games::WorldOfWarcraft.quote
  price = rand(1..10)
  city = Faker::Address.city
  plant = Plant.new(title: title, description: description, price: price, city: city, user: user)
  plant.user = User.all.sample
  plant.save!
end
