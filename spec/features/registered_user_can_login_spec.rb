require 'rails_helper'

describe "registerd user" do
  it "can log into account" do
    user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")
    visit login_path

    fill_in "session[email]", with: "test@test.com"
    fill_in "session[password]", with: "1234"
    fill_in "session[password_confirmation]", with: "1234"
    click_on "Log In"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Sign Out")
    expect(page).to have_content("Successfully signed in!")
  end

  it "cannot log in with invalid credentials" do
    user = User.create(email: "test@test.com", password: "1234", password_confirmation: "1234")
    visit login_path

    fill_in "session[email]", with: "test@test.com"
    fill_in "session[password]", with: "123"
    fill_in "session[password_confirmation]", with: "1234"
    click_on "Log In"

    expect(page).to have_content("Unsuccessful sign in attempt")
  end
end