require "rails_helper"
include SessionsHelper

RSpec.feature "New product form fill", :type => :feature do
  admin = User.new(email: Faker::Internet.email)
  admin.password = "123456"
  admin.admin = true
  admin.save

  context "No current user" do
    scenario "has login button" do
      visit root_path

      expect(page).to have_link('Login')
    end
    scenario "has login button" do
      visit root_path

      expect(page).to have_link('Register')
    end
  end

  context "Registering a new user" do
    scenario "can register with proper information" do
      visit register_path

      fill_in "Email", :with => Faker::Internet.email
      fill_in "Password", :with => "123456"
      fill_in "Password confirmation", :with => "123456"
      click_button "Register"

      expect(page).to have_link('Logout')
    end
    scenario "after successful registration redirect to index" do
      visit register_path

      fill_in "Email", :with => Faker::Internet.email
      fill_in "Password", :with => "123456"
      fill_in "Password confirmation", :with => "123456"
      click_button "Register"

      expect(current_path).to eq(products_path)
    end

    scenario "cannot register without matching passwords" do
      visit register_path

      fill_in "Email", :with => Faker::Internet.email
      fill_in "Password", :with => "123456"
      fill_in "Password confirmation", :with => "123456aa"
      click_button "Register"

      expect(page).to have_text('Password_confirmation doesn\'t match Password')
    end

    scenario "cannot register without proper email" do
      visit register_path

      fill_in "Email", :with => Faker::Lorem.word
      fill_in "Password", :with => "123456"
      fill_in "Password confirmation", :with => "123456"
      click_button "Register"

      expect(page).to have_text('Email is invalid')
    end
  end

  context "An admin is on the login page" do
    scenario "and can log in and redirect to products index page" do
      visit login_path

      fill_in "Email", :with => admin.email
      fill_in "Password", :with => "123456"
      click_button "Log In"

      expect(current_path).to eq(products_path)
    end

    scenario "and gets the add button on products index page" do
      visit login_path

      fill_in "Email", :with => admin.email
      fill_in "Password", :with => "123456"
      click_button "Log In"

      expect(page).to have_button('Add a new product')
    end
  end

  context "An admin is already logged in" do
    before(:each) do
      visit login_path

      fill_in "Email", :with => admin.email
      fill_in "Password", :with => "123456"
      click_button "Log In"
    end
    scenario "An admin can log out and lose the add button on index" do
      click_link "Logout"

      page.should have_no_button('Add a new product')
    end

    scenario "An admin can log out and redirect to products index" do
      click_link "Logout"

      expect(current_path).to eq(products_path)
    end
  end

end
