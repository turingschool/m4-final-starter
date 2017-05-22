require 'rails_helper'

describe "User can create an account" do
    context "when an UNauthenticate user visits the root path" do
      scenario "and they click on sign up" do
          visit root_path

          expect(current_path).to eq('/login')
          expect(page).to have_content("Login")
          expect(page).to have_content("Sign Up by clicking here")
      end
    end

    context "when they click on sign up" do
      scenario "and fill in all necessary fields" do
        visit root_path

        click_on "Sign Up"

        expect(current_path).to eq(new_user_path)

        fill_in "user[first_name]", with: "John"
        fill_in "user[last_name]", with: "Doe"
        fill_in "user[email]", with: "johndoe@gmail.com"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_on "Sign Up"

        expect(page).to have_content "Welcome John"
        expect(page).to have_content "Your Profile"
        expect(current_path).to eq '/index'
      end
    end
  end