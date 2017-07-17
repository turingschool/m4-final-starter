require 'rails_helper'

RSpec.feature "as an authenticated user, when I try to sign up" do
  scenario "I cannot sign up with an email already in use" do
    user1 = create(:user, email: "jane@janedoe.com", password: "password", password_confirmation: "password")

    visit root_path
    click_on "Sign up by clicking here"

    expect(current_path).to eq(signup_path)

    fill_in :user_email, with: "#{user1.email}"
    fill_in :user_password, with: "#{user1.password}"
    fill_in :user_password_confirmation, with: "#{user1.password_confirmation}"
    click_on "Submit"

    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Sorry, but that email has already been taken.")
  end
end
