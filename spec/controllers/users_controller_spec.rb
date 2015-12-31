require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  new_user = User.new(email: Faker::Internet.email)
  new_user.password = "123456"
  new_user.save

  describe '#show' do
    it 'assigns the user instance variable' do
      get :show, id: new_user.id
      expect(assigns(:user)).to be_an(User)
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
