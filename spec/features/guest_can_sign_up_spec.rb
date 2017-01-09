require 'rails_helper'

feature "A guest can sign up" do
   scenario "guest provides with valid information" do
      visit root_path
      click_link "Sign Up"

      expect(current_path).to eq new_user_path
      fill_in :email, with: "raphael@example.com"
      fill_in :password, with: "password"
      fill_in :password_confirmation, with: "password"
      click_button "Sign Up"

      expect(current_path).to eq links_path
   end
end
