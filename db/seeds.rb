titles = ["oneone", "twotwo","three", "fourfour", "fivefive", "sixsix", "seven", "eight", "ninenine", "tenten", "eleven", "twelve"]
titles[rand(0...titles.length)]
def random_date
  year = rand(2015..2018)
  month = rand(1..12)
  day = rand (1..28)
  return Time.parse("#{year}-#{month}-#{day}").utc
end

18.times do
  product = Product.create!(
      title: Faker::Hacker.noun,
      category: "Category here",
      body: Faker::Lorem.paragraph,
      location: "In-Stock",
      quantity: rand(0..10),
      price: rand(100..2000),
      expiration_date: random_date,
    )
  # product.product_img = Rails.root.join("../rails-online-shop-challenge/app/assets/images/cat_package.jpg").open
  product.save
end

admin = User.new(email: 'admin@theboss.com')
admin.password = "password"
admin.admin = true
admin.save

pleb = User.new(email: 'a@a.com')
pleb.password = "123456"
pleb.save
