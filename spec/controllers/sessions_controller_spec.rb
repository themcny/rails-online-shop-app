require 'rails_helper'
include SessionsHelper
RSpec.describe SessionsController, type: :controller do
  new_user = User.new(email: Faker::Internet.email)
  new_user.password = "123456"
  new_user.save

  # bad_user = User.new(email: Faker::Internet.email)
  # bad_user.password = "123456"
  # bad_user.save

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe '#create' do
    context 'when a user successfully logs in' do
      it 'returns a status of 302' do
        log_in(new_user)
        get :create, {session: {email: new_user.email, password: new_user.password}}, {user_id: new_user.id}
        expect(response.status).to eq(302)
      end
    end

    context 'when a user does not successfully log in' do
      it 'returns a status of 200' do
        get :create, {session: {email: new_user.email, password: "eleventeen"}}, {user_id: new_user.id}
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#destroy' do
    it 'returns a status of 302' do
      get :destroy
      expect(response.status).to eq(302)
    end
  end


end
