require 'rails_helper'

describe "user visits the login page" do
  scenario "user can sees the required fields for signing up" do
    visit "/signup"

    expect(page).to have_content("Signup for URL-Lockbox!")
    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")
    expect(page).to have_content("Password Confirmation:")
    expect(page).to have_button("Submit")
  end

  scenario "the user correctly signs up" do
    visit "/signup"

    expect(page).to have_content("Signup")
    # expect(page).to have_content("Login")

    fill_in "user[email]", with: "jason@conrad.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"

    click_on "Submit"

    expect(page).to have_content("You have successfully signed up!")
  end
end
