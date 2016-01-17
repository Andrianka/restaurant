# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.destroy_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

#-----------------------------------------------------------#
Table.destroy_all

10.times do |n|
  Table.create!(nr: n+1, quantity: 4)
end

#-----------------------------------------------------------#
Category.destroy_all
category1 = Category.create!(name: "Salads", order_number: 3)
category2 = Category.create!(name: "Specials", order_number: 1)
category3 = Category.create!(name: "Breakfast", order_number: 2)

@weight = ['100', '200', '350', '250']

Product.destroy_all
['Strawberry', 'SouthWestern Chicken', 'Oriental Chicken', 'Taco', 'Ceaser'].each do |value|
  p = Product.create!(name: value, category_id: Category.find_by(name: 'Salads').id,
  weight: @weight.sample)
  p.price = Faker::Commerce.price
  p.quantity = Faker::Number.decimal(2)
  p.save
end
['Soup cream with wild mushroom', 'Chicken Cordon Blue'].each do  |value|
  p = Product.create!(name: value, category_id: Category.find_by(name: 'Specials').id,
  weight: @weight.sample)
  p.price = Faker::Commerce.price
  p.quantity = Faker::Number.decimal(2)
  p.save
end
["Belgian waffles", "Eggs", "Toasts"].each do  |value|
  p =Product.create!(name: value, category_id: Category.find_by(name: 'Breakfast').id,
  weight: @weight.sample)
  p.price = Faker::Commerce.price
  p.quantity = Faker::Number.decimal(2)
  p.save
end

#-----------------------------------------------------------#
User.destroy_all
boss = User.create!(email: 'boss@example.com', password: 'password',
  password_confirmation: 'password', person_attributes: {roles: [:boss],
  first_name: 'Boss name', last_name: 'Boss surname' }
)

manager = User.create!(email: 'manager@example.com', password: 'password',
  password_confirmation: 'password', person_attributes: {roles: [:manager],
  first_name: 'Manager name', last_name: 'Manager surname' }
)

waiter = User.create!(email: 'waiter@example.com', password: 'password',
  password_confirmation: 'password', person_attributes: {roles: [:waiter],
  first_name: 'Waiter name', last_name: 'Waiter surname' }
)

cook = User.create!(email: 'cook@example.com', password: 'password',
  password_confirmation: 'password', person_attributes: {roles: [:cook],
  first_name: 'Boss name', last_name: 'Cook surname' }
)

client = User.create!(email: 'client@example.com', password: 'password',
  password_confirmation: 'password', person_attributes: {roles: [:client],
  first_name: 'Client name', last_name: 'Client surname' }
)
