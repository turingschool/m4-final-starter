require 'rails_helper'

describe "when a user visits the root page, and they click on sign up" do
  scenario "they are taken to a form where they can create an account" do
    visit root_path
    click_on "Sign Up"
    expect(current_path).to eq(new_user_path)

    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "test"
    fill_in "user[password_confirmation]", with: "test"
    click_on "Create Account"

    expect(current_path).to eq(links_path)
    expect(page).to_not have_content("Sign Up")
    expect(page).to have_content("Welcome: test@test.com")
  end
end
