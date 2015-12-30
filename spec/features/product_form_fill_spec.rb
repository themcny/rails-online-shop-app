require "rails_helper"

RSpec.feature "New product form fill", :type => :feature do
  scenario "User creates a new product" do
    visit "/products/new"

    fill_in "Title", :with => "Wrong1"
    click_button "Add"

    expect(page).to have_text("Title only allows letters")
  end
end
