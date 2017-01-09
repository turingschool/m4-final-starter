require 'rails_helper'

feature "A guest can sign up" do
   scenario "guest provides with valid information" do

      visit root_path
      click_link "Sign Up by clicking here"

      expect(current_path).to eq signup_path
      fill_in :user_email, with: "raphael@example.com"
      fill_in :user_password, with: "password"
      fill_in :user_password_confirmation, with: "password"
      click_button "Submit"

      expect(current_path).to eq links_path
   end

   scenario "guest cannot sign with invalid info" do

      visit root_path
      click_link "Sign Up by clicking here"

      expect(current_path).to eq signup_path
      fill_in :user_email, with: "raphael@example.com"
      click_button "Submit"

      error = "Password can't be blank SignUp ! Email Password Password confirmation Already an user? Log in by clicking here"

      expect(page).to have_content(error)
   end

end
