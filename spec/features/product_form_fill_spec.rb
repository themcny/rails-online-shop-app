require "rails_helper"

RSpec.feature "New product form fill", :type => :feature do
  scenario "User doesn't input a title" do
    visit "/products/new"

    fill_in "Title", :with => ""
    click_button "Add"

    expect(page).to have_text("Title can't be blank")
  end

  scenario "User doesn't input a body" do
    visit "/products/new"

    fill_in "Body", :with => ""
    click_button "Add"

    expect(page).to have_text("Body can't be blank")
  end

  scenario "User doesn't input a location" do
    visit "/products/new"

    fill_in "Location", :with => ""
    click_button "Add"

    expect(page).to have_text("Location can't be blank")
  end

  scenario "User doesn't input a category" do
    visit "/products/new"

    fill_in "Category", :with => ""
    click_button "Add"

    expect(page).to have_text("Category can't be blank")
  end

  scenario "User doesn't input a quantity" do
    visit "/products/new"

    fill_in "Quantity", :with => ""
    click_button "Add"

    expect(page).to have_text("Quantity can't be blank")
  end

end
