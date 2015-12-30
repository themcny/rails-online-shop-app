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

  context "A product's location" do
    product = Product.new(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1
        )

    it "can be In-Stock" do
      product.location = "In-Stock"
      expect(product.save)
    end

    it "can be In-Transit" do
      product.location = "In-Transit"
      expect(product.save)
    end

    it "can be Out-of-Stock" do
      product.location = "Out-of-Stock"
      expect(product.save)
    end

    it "can be Everywhere" do
      product.location = "Everywhere"
      expect(product.save)
    end

    it "cannot be anything else" do
      product.location = "hello"
      product.save
      expect(product.errors.full_messages).to eq(["Location : \'#{product.location}\' is not included in the list, try dashes instead of spaces!"])
    end
  end

  context "A new product will not be created if" do
    it "has numbers in the title" do
      failure = Product.create(
        title: "1 Object",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "Out-of-Stock",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1
        )
      expect(failure.errors.full_messages).to eq(["Title only allows letters"])
    end

    it "body is too short" do
      failure = Product.create(
        title: "Title",
        body: "World",
        location: "In-Stock",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1
        )
      expect(failure.errors.full_messages).to eq(["Body is too short (minimum is 20 characters)"])
    end

    it "body is too long" do
      failure = Product.create(
        title: "Title",
        body: "World"*201,
        location: "In-Transit",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1
        )
      expect(failure.errors.full_messages).to eq(["Body is too long (maximum is 1000 characters)"])
    end

    it "title is too short" do
      failure = Product.create(
        title: "Hell",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "In-Stock",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1
        )
      expect(failure.errors.full_messages).to eq(["Title is too short (minimum is 5 characters)"])
    end

     it "title is too long" do
      failure = Product.create(
        title: "Hello"*5,
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "In-Stock",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1
        )
      expect(failure.errors.full_messages).to eq(["Title is too long (maximum is 15 characters)"])
    end

    it "category is too short" do
      failure = Product.create(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "In-Stock",
        category: "Web",
        price: 999,
        quantity: 1
        )
      expect(failure.errors.full_messages).to eq(["Category is too short (minimum is 5 characters)"])
    end

    it "category is too long" do
      failure = Product.create(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "In-Stock",
        category: "Web development leitmotiv"*100,
        price: 999,
        quantity: 1
        )
      expect(failure.errors.full_messages).to eq(["Category is too long (maximum is 30 characters)"])
    end

    it "category contains a number" do
      failure = Product.create(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "In-Stock",
        category: "Web development3",
        price: 999,
        quantity: 1
        )
      expect(failure.errors.full_messages).to eq(["Category only allows letters, spaces, and punctuation."])
    end

    it "location is not a proper type" do
      failure = Product.create(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "newish location",
        category: "Web development",
        price: 999,
        quantity: 1
        )
      expect(failure.errors.full_messages).to eq(["Location : \'#{failure.location}\' is not included in the list, try dashes instead of spaces!"])
    end

    it "quantity is not an integer" do
      failure = Product.create(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "In-Stock",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 'hey'
        )
      expect(failure.errors.full_messages).to eq(["Quantity is not a number"])
    end

    it "price is not an integer" do
      failure = Product.create(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "In-Stock",
        category: "Web development leitmotiv",
        price: 'nope',
        quantity: 1
        )
      expect(failure.errors.full_messages).to eq(["Price is not a number"])
    end
  end
end


