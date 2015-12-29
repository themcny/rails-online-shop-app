items = ["Object n°1", "Object n°2", "Object n°3", "Object n°4", "Object n°5", "Object n°6", "Object n°7", "Object n°8", "Object n°9", "Object n°10"]

items.each do |item|
  Product.create!(
    title: item,
    category: Faker::Commerce.department,
    body: Faker::Lorem.sentence,
    location: "In stock",
    quantity: rand(1..10),
    price: rand(100..2000)
  )
end
