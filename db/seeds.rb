# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  Image.create(item_id: 1 + n, url: "51XyLHYl4pL._SY355_.jpg")
end

10.times do |n|
  Item.create(user_id: n, name: "サンプル", body: "サンプルサンプル", price: "200", condition: "#{n}", shipping_id: n, status: "#{n}", order_status: "#{n}")
end

10.times do |n|
  Shipping.create(prefecure: "#{n}", method: "サンプル", cost_burden: "サンプルサンプル", period_before_shipping: "#{n}")
end