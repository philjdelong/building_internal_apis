# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  Item.create!(
    name: Faker::Commerce.product_name,
    description: Faker::ChuckNorris.fact,
  )
end

10.times do
  Order.create!(order_number: rand(100000..999999))
end

100.times do
  OrderItem.create!(
    item_id: rand(1..10),
    order_id: rand(1..10),
    item_price: rand(100..10000),
    quantity: rand(1..10)
  )
end
