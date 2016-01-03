require 'rails_helper'
include SessionsHelper

RSpec.describe UsersController, type: :controller do
  new_user = User.new(email: Faker::Internet.email)
  new_user.password = "123456"
  new_user.save

  admin = User.new(email: Faker::Internet.email)
  admin.password = "password"
  admin.admin = true
  admin.save

  describe '#show' do
    context 'as an admin' do
      it 'assigns the user instance variable' do
        log_in(admin)
        get :show, id: new_user.id
        expect(assigns(:user)).to be_an(User)
      end
    end
    context 'as a pleb' do
      before (:each) do
        log_in(new_user)
      end
      it 'has the current user as the pleb' do
        get :show, {:session => {email: new_user.email, id: new_user.id}}
        expect(new_user.id).to eq(current_user.id)
      end
      it 'assigns the user instance variable' do
        get :show, id: new_user.id.to_i
        expect(assigns(:user)).to be_a(User)
      end
    end
    context 'not logged in at all' do
      it 'redirects to login' do
        expect(get :show, id: new_user.id).to redirect_to('/login')
      end
    end
  end

  describe '#index' do
    context "as an admin" do
      it 'assigns the users instance variable' do
        log_in(admin)
        get :index
        expect(assigns(:users)).to be_an(ActiveRecord::Relation)
      end
    end
    context "as a pleb" do
      it "redirects to log in" do
        log_in(new_user)
        expect(get :index).to redirect_to('/login')
      end
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe '#create' do
    let(:params) {{"user"=>{
      "email"=> Faker::Internet.email,
      "password"=>"123456",
      "password_confirmation"=>"123456"
     },
     "timezone" => "America/Guam"
     }}
    let(:bad_params) {{"user"=>{
      "email"=> Faker::Internet.email,
      "password"=>"12345wer",
      "password_confirmation"=>"12asd345"
      },
      "timezone" => "America/Guam"
    }}

    context "when a user is successfully created" do
      it "returns a response code of 302" do
        post :create, params
        expect(response.status).to eq(302)
      end
    end

    context "when a user is not successfully created" do
      it 'responds with a status of 200' do
        post :create, bad_params
        expect(response.status).to eq(200)
      end
    end
  end
end
