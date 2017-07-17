require 'rails_helper'

describe "registered user" do
  it "can log out after signing in" do
    user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")

    login_user(user)

    expect(page).to_not have_content("Sign in")
    click_on "Sign Out"
    expect(current_path).to eq(login_path)
  end
end