require 'rails_helper'
include SessionsHelper

RSpec.describe CartsController, type: :controller do
  let!(:new_product) {Product.create({"title"=>"hello",
  "body" => "is this twenty characters long yet i hope it is",
  "location" => "In-Stock",
  "category" => "Home Goods",
  "price" => 2,
  "quantity" => 4,
  "expiration_date" => Time.parse('2020-05-10'),
  })}
  admin = User.new(email: Faker::Internet.email)
  admin.password = "123456"
  admin.admin = true
  admin.save

  pleb = User.new(email: Faker::Internet.email)
  pleb.password = "123456"
  pleb.save

  describe "#show" do
    before(:each) do
      log_in(pleb)
      get :show, id: pleb.id
    end
    it 'instantiates a new cart on login' do
      expect(pleb.id).to eq(Cart.last.id)
    end

    it 'responds with a status of 200' do
      expect(response.status).to eq(200)
    end
  end

  describe "#update" do
    before(:each) do
      log_in(pleb)
    end

    it 'instantiates/finds a new cart on login' do
      expect(pleb.id).to eq(Cart.last.id)
    end

    it "responds with a 200 code" do
      expect(response.status).to eq(200)
    end
  end

end
