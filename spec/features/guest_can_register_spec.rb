require 'rails_helper'

RSpec.feature "as a guest on the site"  do
  scenario "I can register a new account" do
    visit root_path

    click_on "Register"
    expect(current_path).to eq(new_user_path)
    fill_in :user_email, with: "user@gmail.com"
    fill_in :user_password, with: "123"
    fill_in :user_password_confirmation, with: "123"

    click_on "Submit"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Signup")
  end
end
