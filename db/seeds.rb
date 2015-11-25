# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

10.times do |n|
  Table.create!(nr: n+1, quantity: 4)
end
category1 = Category.create!(name: "Salads", order_number: 3)
category2 = Category.create!(name: "Specials", order_number: 1)
category3 = Category.create!(name: "Breakfast", order_number: 2)

Product.create!(name: "Belgian waffle", category_id: category3.id)
Product.create!(name: "Product2", category_id: category1.id)
Product.create!(name: "Product3", category_id: category2.id)
