require 'rails_helper'

RSpec.feature "Unathenticated User Can Sign Up", type: :feature do
  it "shows sign up form" do
    visit root_path

    expect(page).to have_link("Log In")

    click_on "Sign Up"

    expect(page).to have_field("user_email")
    expect(page).to have_field("user_password")
    expect(page).to have_field("user_password_confirmation")
  end

  it "allows new user to creat and account" do
    visit new_user_registration_path
    fill_in "user[email]", with: "jasmin@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Sign up"

    user = User.last
    # expect(current_user).to eq(user)
    expect(current_path).to eq(links_path)
  end
end
