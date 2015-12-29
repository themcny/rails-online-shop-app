require "rails_helper"

# Testing #index
RSpec.describe ProductsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the products into @products" do
      Product.all.clear
      p1 = Product.create!(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "Everywhere",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1)

      p2 = Product.create!(
        title: "Hella",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "Everywhere",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1
        )

      get :index
      expect(assigns(:products)).to match_array([p1, p2])
    end
  end
end

#Testing #new
RSpec.describe ProductsController do
  describe "GET new" do
    it "renders the create form" do
      get :new
      expect(response).to render_template("new")
    end
  end
end

#Testing #create
RSpec.describe ProductsController do
  describe "POST create" do
    it "allows user to create a product" do
      product = Product.create!(
        title: "Hello",
        body: "World is a great place to live in even if it's fucked up sometimes",
        location: "Everywhere",
        category: "Web development leitmotiv",
        price: 999,
        quantity: 1)
      post :create
      expect(response).to render_template("index")
    end
  end
end

