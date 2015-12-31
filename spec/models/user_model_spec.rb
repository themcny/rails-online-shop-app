require 'rails_helper'

RSpec.describe User, type: :model do

  describe "generates an object that ..." do
    regular_user = User.new(email: "sad@sadness.com", timezone: "America/Guam")
    regular_user.password ="123456"
    regular_user.save

    it "says it is a user" do
      regular_user.should be_a(User)
    end

    it "returns the correct name" do
      expect(regular_user.email).to eq("sad@sadness.com")
    end

    it "saves the correct password" do
      expect(regular_user.authenticate("123456")).to be_truthy
    end

    it "returns the correct timezone" do
      expect(regular_user.timezone).to eq("America/Guam")
    end
  end
end
