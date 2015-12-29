# Custom tests
require "rails_helper"

# Controller product creation test
RSpec.describe Product, :type => :model do
  context "A new product" do
      product = Product.create!(
        title: "Hello",
        body: "World",
        location: "Everywhere",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1
        )

    it "have all the fields filled up when created" do
      expect(product != nil).to be(true)
    end

    it "have a string data types for title, body, location and category" do
      expect(
        (product.title).is_a?(String)    &&
        (product.body).is_a?(String)     &&
        (product.location).is_a?(String) &&
        (product.category).is_a?(String)
        ).to be(true)
    end

    it "have a integer different kind of data types for price and quantity" do
      expect((product.price).is_a?(Integer)).to be(true)
    end

  end
end
