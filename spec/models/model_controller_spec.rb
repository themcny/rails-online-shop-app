# Custom tests
require "rails_helper"

RSpec.describe Product, :type => :model do
  context "A new product" do
      product = Product.create!(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
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



    product.destroy

    # it "can be deleted" do
    #   p product.id
    #   p Product.destroy(product.id)
    #   p expect(product).to be(nil)
    # end

  end
  context "A new product will not be created if" do
    it "has numbers in the title" do
      failure = Product.create(
        title: "1 Object",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "Everywhere",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1
        )
      expect(failure.id).to eq(nil)
    end

    it "body is too short" do
      failure = Product.create(
        title: "Title",
        body: "World",
        location: "Everywhere",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1
        )
      expect(failure.id).to eq(nil)
    end

    it "body is too long" do
      failure = Product.create(
        title: "Title",
        body: "World"*201,
        location: "Everywhere",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1
        )
      expect(failure.id).to eq(nil)
    end

    it "title is too short" do
      failure = Product.create(
        title: "Hell",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "Everywhere",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1
        )
      expect(failure.id).to eq(nil)
    end

     it "title is too short" do
      failure = Product.create(
        title: "Hello"*5,
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "Everywhere",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1
        )
      expect(failure.id).to eq(nil)
    end

    it "category is too short" do
      failure = Product.create(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "Everywhere",
        category: "Web",
        price: 999,
        quantity: 1
        )
      expect(failure.id).to eq(nil)
    end

    it "category is too long" do
      failure = Product.create(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "Everywhere",
        category: "Web development leitmotiv"*100,
        price: 999,
        quantity: 1
        )
      expect(failure.id).to eq(nil)
    end

    it "category contains a number" do
      failure = Product.create(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "Everywhere",
        category: "Web development3",
        price: 999,
        quantity: 1
        )
      expect(failure.id).to eq(nil)
    end

    it "quantity is not an integer" do
      failure = Product.create(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "Everywhere",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 'hey'
        )
      expect(failure.id).to eq(nil)
    end

    it "price is not an integer" do
      failure = Product.create(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "Everywhere",
        category: "Web development leitmotiv",
        price: 'nope',
        quantity: 1
        )
      expect(failure.id).to eq(nil)
    end
  end
end
