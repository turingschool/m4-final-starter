require 'rails_helper'

describe "User can create an account" do
    context "when an UNauthenticate user visits the root path" do
      scenario "and they click on sign up" do
          visit root_path

          expect(current_path).to eq('/login')
          expect(page).to have_content("Log In or Sign Up")
          expect(page).to have_content("Sign Up")
          expect(page).to have_content("Log In")
      end
    end
  end