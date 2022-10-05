# frozen_string_literal: true

require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# We have to create the 'Stores' first in order to apply the relation between tables
# Create Stores
# 5.times do |i|
#   puts "Creating store #{i + 1}"
#   Store.create(
#     name: Faker::Company.name,
#     address: Faker::Address.full_address
#   )
# end

# # Crate Employees
5.times do |i|
  puts "Creating employee #{i + 1}"
  first_name_variable = Faker::Name.first_name
  store_id_variable = rand(1..5)
  Employee.create(first_name: first_name_variable,
                  last_name: Faker::Name.last_name,
                  email: Faker::Internet.free_email(name: first_name_variable),
                  position: Faker::Job.title,
                  private_number: rand(1000000000..9999999999),
                  store_id: store_id_variable,
                  working: true)
end

# Create Foods
20.times do |i|
  puts "Creating food #{i + 1}"
  food_name = Faker::Food.dish
  food_price = rand(50..250)
  food_type = "Food"
  Food.create(name: food_name,
              quantity: rand(150-455),
              price: food_price,
              type: food_type)
end
