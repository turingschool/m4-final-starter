require 'rails_helper'

RSpec.describe 'Unauthenticated User' do
  context 'sucessful signup' do
    it 'can sign up' do
      visit root_path

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Login or Sign Up")

      click_on('Create Account')

      expect(current_path).to eq(new_user_path)

      fill_in "user[email]", with: "d@d.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on('Create Account')

      expect(current_path).to eq(links_path)
      expect(page).to have_content("Successfully created acount!")
    end
  end
end
