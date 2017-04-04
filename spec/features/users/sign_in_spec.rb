require 'rails_helper'

feature 'Sign' do
  context 'a user would like to login' do
    before { visit login_path }
    scenario 'the user logs in' do
      fill_in 'email', with: 'waylon_jennings@country.com'
      fill_in 'password', with: 'password'
      click_on 'Login'

      expect(page).to have_content("You've successfully logged in!")
      expect(page).to have_current_path('/links')
    end
  end
end
