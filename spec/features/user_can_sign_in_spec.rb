require "rails_helper"

RSpec.describe "user can sign in" do
  scenario "unauthenticated user can register" do

    visit "/"
    click_on "Sign Up"
    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "j@j.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Register"

    expect(current_path).to eq('/links')
    expect(User.count).to eq(1)
  end

  scenario "user cannot register without email" do

    visit "/"
    click_on "Sign Up"
    expect(page).to have_content("Create an Account")

    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Register"

    expect(current_path).to eq('/users')
    expect(User.count).to eq(0)
  end

  scenario "user cannot register without password" do
    visit "/"
    click_on "Sign Up"
    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "i@i.com"
    fill_in "Password Confirmation", with: "password"
    click_on "Register"

    expect(current_path).to eq('/users')
    expect(User.count).to eq(0)
  end

  scenario "user cannot register without matching password and confirmation" do
    visit "/"
    click_on "Sign Up"
    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "i@i.com"
    fill_in "Password", with: "cherry"
    fill_in "Password Confirmation", with: "password"
    click_on "Register"

    expect(page).to have_content("Password and Password Confirmation must match")
    expect(current_path).to eq('/users')
    expect(User.count).to eq(0)
  end

  scenario "user cannot register with a taken email" do

    User.create(email: "i@i.com", password: "password")
    visit "/"
    click_on "Sign Up"
    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "i@i.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Register"
    expect(page).to have_content("Email already taken")
    expect(current_path).to eq('/users')
    expect(User.count).to eq(1)
  end


end
