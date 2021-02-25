# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning the database"

Hero.destroy_all
User.destroy_all

puts "Database clean"

puts "Creating heroes"

user1 = User.create(email: "fernando@fernando.com", password: "123456")
user2 = User.create(email: "jens@jens.com",  password: "123456")
user3 = User.create(email: "cynthia@cynthia.com",  password: "123456")
user4 = User.create(email: "nick@nick.com", password: "123456")

50.times do
  Hero.create!(user: user1,
    name: Faker::Superhero.name,
    skill: Faker::Superhero.power,
    description: Faker::Quote.most_interesting_man_in_the_world,
    price: (0..20000).to_a.sample)
end

puts "Heroes created"