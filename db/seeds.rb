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
5.times do |i|
  puts "Creating store #{i}"
  Store.create(
    name: Faker::Company.name,
    address: Faker::Address.full_address
  )
end

# # Crate Employees
10.times do |i|
  puts "Creating employee #{i}"
  first_name_variable = Faker::Name.first_name
  store_id_variable = rand(1..5)
  Employee.create(first_name: first_name_variable,
                  last_name: Faker::Name.last_name,
                  email: Faker::Internet.free_email(name: first_name_variable),
                  position: Faker::Job.title,
                  private_number: rand(1000..9999),
                  store_id: store_id_variable,
                  working: true)
end
