require 'rails_helper'

describe "guest user" do
  it "can create a new account" do
    visit root_path

    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)

    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "1234"
    fill_in "user[password_confirmation]", with: "1234"
    click_on "Register"

    expect(current_path).to eq(links_path)
    expect(page).to_not have_content("Sign Up")
    expect(page).to have_content("Sign Out")
  end

  it "cannot create account without email" do
    visit new_user_path

    fill_in "user[password]", with: "1234"
    fill_in "user[password_confirmation]", with: "1234"
    click_on "Register"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("You must enter an email")
  end

  it "cannot create account without password" do
    visit new_user_path

    fill_in "user[email]", with: "test@test.com"
    click_on "Register"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("You must enter an password and password confirmation")
  end

  it "cannot create account without matching password and password confirmation" do
    visit new_user_path

    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "1234"
    fill_in "user[password_confirmation]", with: "123"
    click_on "Register"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Password and password confirmation do not match")
  end
end