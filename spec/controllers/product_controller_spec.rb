require "rails_helper"
include SessionsHelper

RSpec.describe ProductsController, :type => :controller do
  # let (:new_product) {FactoryGirl.build(:product)}
  let!(:new_product) {Product.create({"title"=>"hello",
  "body" => "is this twenty characters long yet i hope it is",
  "location" => "In-Stock",
  "category" => "Home Goods",
  "price" => 2,
  "quantity" => 4,
  })}
  admin = User.new(email: Faker::Internet.email)
  admin.password = "123456"
  admin.admin = true
  admin.save

  pleb = User.new(email: Faker::Internet.email)
  pleb.password = "123456"
  pleb.save

  # before logging in - these should be accessible to all

  describe "#index" do
    before(:each) do
      get :index
    end
    it "responds with a 200 code" do
      expect(response.status).to eq(200)
    end

    it 'assigns the product instance variable' do
      expect(assigns(:products)).to be_an(ActiveRecord::Relation)
    end
  end

  describe "#show" do
    let(:new_product) {Product.create({"title"=>"hello",
      "body" => "is this twenty characters long yet i hope it is",
      "location" => "In-Stock",
      "category" => "Home Goods",
      "price" => 2,
      "quantity" => 4,
      })}
    before(:each) do
      get :show, id: new_product.id
    end
    it 'assigns the product instance variable' do
      expect(assigns(:product)).to be_a(Product)
    end

    it 'responds with a status of 200' do
      expect(response.status).to eq(200)
    end
  end

  # test admin features

  describe '#logged in as admin' do
    before(:each) do
      log_in(admin)
    end
    context "#new" do
      before(:each) do
        get :new
      end
      it 'assigns the product instance variable ' do
        expect(assigns(:product)).to be_a_new(Product)
      end
    end
    context "#create" do
      let(:params) {{"product"=>{"title"=>"hello",
        "body" => "is this twenty characters long yet i hope it is",
        "location" => "In-Stock",
        "category" => "Home Goods",
        "price" => 2,
        "quantity" => 4,
        }}}
      let(:bad_params) {{"product"=>{"title"=>"hello",
        "body" => "is this twenty characters long yet i hope it is",
        "location" => "In-Stock",
        "category" => "Home Goods",
        "price" => 2,
        "quantity" => 4.5,
        }}}
      it 'increments the total number of products by 1' do
        expect{post :create, params}.to change{Product.count}.by(1)
      end
      context 'when a new product is successfully created' do
        it 'responds with a status of 302' do
          post :create, params
          expect(response.status).to eq(302)
        end
      end
      context 'when a new product is not successfully created' do
        it 'responds with a status of 200' do
          post :create, bad_params
          expect(response.status).to eq(200)
        end
      end
    end
    describe "#destroy" do
      it 'responds with a status of 302' do
        get :destroy, id: new_product.id
        expect(response.status).to eq(302)
      end
      it 'decrements the total number of products by 1' do
        expect{delete :destroy, id: new_product.id}.to change{Product.count}.by(-1)
      end
    end

    describe "#edit and #update" do
      let(:old_product) {Product.create({"title"=>"hello",
        "body" => "is this twenty characters long yet i hope it is",
        "location" => "In-Stock",
        "category" => "Home Goods",
        "price" => 2,
        "quantity" => 4,
        })}
      context "When rendering an edit page" do
        it 'responds with a status of 200' do
          log_in(admin)
          get :edit, id: old_product.id
          expect(response.status).to eq(200)
        end
      end
      context "When updating product" do
        let (:params) {{"product" =>{title: "goodbye"}, id: old_product.id}}
        let (:bad_params) {{"product" =>{title: "g"}, id: old_product.id}}
        it 'updates proper attribute of object' do
          patch :update, params
          expect(old_product.reload.title).to eq("goodbye")
        end
        it 'responds with a status of 302' do
          patch :update, params
          expect(response.status).to eq(302)
        end
        it 'does not allow edits that violate validations' do
          patch :update, bad_params
          expect(response.status).to eq(200)
        end
      end
    end
  end

  # test pleb features (or lack thereof)
  describe '#logged in as a pleb' do
    before(:each) do
      log_in(pleb)
    end
    context "#new" do
      before(:each) do
        get :new
      end
      it 'assigns the product instance variable ' do
        expect(assigns(:product)).to be_nil
      end
    end
    context "#create" do
      it 'cannot go to create route' do
        expect(:post => '/create').not_to be_routable
      end
    end

    context "#destroy" do
      it 'cannot hit destroy/delete route' do
        expect(:get => '/destroy').not_to be_routable
      end
    end

    context "#edit and #update" do
      it 'responds with a status of 302' do
        get :edit
        expect(response.status).to eq(302)
      end
      it 'cannot hit update route' do
        expect(:post => '/update').not_to be_routable
      end
    end

  end
end
