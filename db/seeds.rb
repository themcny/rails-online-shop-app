items = ["Object One", "Object Two", "Object Three", "Object Four", "Object Five", "Object Six", "Object Seven", "Object Eight", "Object Nine", "Object Ten"]

10.times do
  product = Product.create!(
      title: "Title",
      category: "Category here",
      body: Faker::Lorem.paragraph,
      location: "In-Stock",
      quantity: rand(1..10),
      price: rand(100..2000),
      expiration_date: Time.parse('2003-10-10').utc,
    )
  # product.product_img = Rails.root.join("../rails-online-shop-challenge/app/assets/images/cat_package.jpg").open
  product.save
end

admin = User.new(email: 'admin@theboss.com')
admin.password = "password"
admin.admin = true
admin.save
