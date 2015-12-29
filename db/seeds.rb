items = ["Object One", "Object Two", "Object Three", "Object Four", "Object Five", "Object Six", "Object Seven", "Object Eight", "Object Nine", "Object Ten"]

items.each do |item|
  Product.create!(
    title: item,
    category: "Category here",
    body: Faker::Lorem.sentence,
    location: "In stock",
    quantity: rand(1..10),
    price: rand(100..2000)
  )
end
