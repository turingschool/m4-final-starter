require 'rails_helper'

describe "guest user" do
  it "can create a new account" do
    user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")
    visit root_path

    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)

    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "test"
    fill_in "user[password_confirmation]", with: "test"
    click_on "Register"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Email has already been taken")
  end

end