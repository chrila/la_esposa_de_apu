# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# generate babies and breastfeedings
8.times do
  baby = Baby.create(name: Faker::Name.first_name)
  rand(10..50).times do
    Breastfeeding.create(amount: rand(1.0..20.0).round(1), time: rand(1.0..60.0).round(1), baby: baby)
  end
end
