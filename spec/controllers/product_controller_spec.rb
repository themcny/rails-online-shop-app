require "rails_helper"

RSpec.describe ProductsController, :type => :controller do
  # let (:new_product) {FactoryGirl.build(:product)}
  let!(:new_product) {Product.create({"title"=>"hello",
  "body" => "is this twenty characters long yet i hope it is",
  "location" => "In-Stock",
  "category" => "Home Goods",
  "price" => 2,
  "quantity" => 4,
  })}

  describe "#index" do
    before(:each) do
      get :index
    end
    it "responds with a 200 code" do
      expect(response.status).to eq(200)
    end

    it 'assigns the product instance variable' do
      p assigns(:products)
      expect(assigns(:products)).to be_an(ActiveRecord::Relation)
    end
  end

  describe "#new" do
    before(:each) do
      get :new
    end
    it 'assigns the product instance variable' do
      expect(assigns(:product)).to be_a_new(Product)
    end
  end


  describe "#create" do
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
