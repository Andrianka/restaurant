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
['Specials', 'Dinner', 'Lunch', 'Breakfast', 'Brunch', 'Dessert'].each_with_index do |k, v|
  c = Category.create!(name: k, order_number: v)
end

@weight = ['100', '200', '350', '250']

Product.destroy_all
["ROASTED ACORN SQUASH SOUP", "SHRIMP COCKTAIL & PROSCIUTTO",
"SIMPLE SALAD", "BABY BEETS & CITRUS", "BLUE CRAB RAVIOLO",
"LOBSTER TOAST", "GOFFLE ROAD FARM CHICKEN BREAST"].each do |value|
  p = Product.create!(name: value, category_id: Category.find_by(name: 'Dinner').id,
  weight: @weight.sample)
  p.price = Faker::Number.between(5, 40)
  p.quantity = Faker::Number.between(1, 20)
  p.save
end
["BREAST OF LONG ISLAND DUCK", "BEER CHEESE & BROCCOLI",
"PECORINO FRIES", "CREEKSTONE FARMS SHORTRIB"].each do  |value|
  p = Product.create!(name: value, category_id: Category.find_by(name: 'Specials').id,
  weight: @weight.sample)
  p.price = Faker::Number.between(5, 40)
  p.quantity = Faker::Number.between(1, 20)
  p.save
end
["HEARTY GREEN SALAD", "CHARRED BUTTERNUT SQUASH", "ROASTED ACORN SQUASH SOUP",
"CHEESE & SEASONAL FRUIT", "MAINE LOBSTER TOAST"].each do  |value|
  p = Product.create!(name: value, category_id: Category.find_by(name: 'Brunch').id,
  weight: @weight.sample)
  p.price = Faker::Number.between(1, 15)
  p.quantity = Faker::Number.between(1, 20)
  p.save
end

["CROISSANT", "GRAPEFRUIT BRULEE", "SMOKED PASTRAMI SALMON",
"CHEESE & CURED MEATS", "FRUIT SALAD & BERRIES", "CLASSIC EGGS BENEDICT",
"ORGANIC EGG WHITE OMELET", "FRESH BAKED WAFFLES"].each do  |value|
  p = Product.create!(name: value, category_id: Category.find_by(name: 'Breakfast').id,
  weight: @weight.sample)
  p.price = Faker::Number.between(1, 15)
  p.quantity = Faker::Number.between(1, 20)
  p.save
end

["DRUNKEN DONUTS", "COFFEE", "CAPPUCCINO", "ESPRESSO",
"COFFEE","KITCHEN CHEESE PLATE"].each do  |value|
  p = Product.create!(name: value, category_id: Category.find_by(name: 'Dessert').id,
  weight: @weight.sample)
  p.price = Faker::Number.between(1, 15)
  p.quantity = Faker::Number.between(1, 20)
  p.save
end
#-----------------------------------------------------------#
User.destroy_all
Person.destroy_all
boss = User.create!(email: 'boss@example.com', password: 'password',
  password_confirmation: 'password', person_attributes: {roles: [:boss],
  first_name: Faker::Name.first_name, last_name: Faker::Name.last_name }
)

manager = User.create!(email: 'manager@example.com', password: 'password',
  password_confirmation: 'password', person_attributes: {roles: [:manager],
  first_name: Faker::Name.first_name, last_name: Faker::Name.last_name }
)

waiter = User.create!(email: 'waiter@example.com', password: 'password',
  password_confirmation: 'password', person_attributes: {roles: [:waiter],
  first_name: Faker::Name.first_name, last_name: Faker::Name.last_name }
)

cook = User.create!(email: 'cook@example.com', password: 'password',
  password_confirmation: 'password', person_attributes: {roles: [:cook],
  first_name: Faker::Name.first_name, last_name: Faker::Name.last_name }
)

30.times do |n|
  client = User.create!(email: "client_#{n}@example.com", password: 'password',
    password_confirmation: 'password', person_attributes: {roles: [:client],
    first_name: Faker::Name.first_name, last_name: Faker::Name.last_name }
  )
end
