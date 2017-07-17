require 'rails_helper'

RSpec.feature "as an authenticated user, when I try to sign up" do
  scenario "I cannot sign up if password and confirmation do not match" do
    visit root_path
    click_on "Sign up by clicking here"

    expect(current_path).to eq(signup_path)

    fill_in :user_email, with: "janedoe@janedoe.com"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "1234"
    click_on "Submit"

    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Password confirmation doesn't match password.")
  end
end
