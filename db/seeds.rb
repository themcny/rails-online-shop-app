10.times do
  Product.create!(
    title: Faker::Lorem.word,
    category: Faker::Commerce.department,
    body: Faker::Lorem.sentence,
    location: "In stock",
    quantity: rand(1..10),
    price: rand(1..100)
  )
end
