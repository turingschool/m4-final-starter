require 'rails_helper'

RSpec.feature "as an authenticated user, when I visit '/'" do
  scenario "i can sign up for a new account" do
    visit root_path
    click_on "Sign up by clicking here"

    expect(current_path).to eq(signup_path)

    fill_in :user_email, with: "janedoe@janedoe.com"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_on "Submit"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome: janedoe@janedoe.com")
    expect(page).to_not have_content("Sign up by clicking here")
    expect(page).to have_content("URL")
    expect(page).to have_content("Title")
  end
end
