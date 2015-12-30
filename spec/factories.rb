FactoryGirl.define do
  factory :product do
    title "hello",
    body "is this twenty characters long yet i hope it is",
    location "In-Stock",
    category "Home Goods",
    price 2,
    quantity 4,
  end
end
