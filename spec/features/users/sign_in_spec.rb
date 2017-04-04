require 'rails_helper'

feature 'Sign in' do
  context 'a user would like to login' do
    let!(:user) { create(:user) }

    before { visit login_path }
    scenario 'the user logs in' do
      fill_in 'email', with: 'waylon_1@country.com'
      fill_in 'password', with: 'password'
      click_on 'Login'


      expect(page).to have_content("You've successfully logged in!")
      expect(page).to have_current_path('/links')
    end

    scenario 'the user fails to log in' do
      fill_in 'email', with: 'waylon_1@country.com'
      fill_in 'password', with: 'cat-burgers'
      click_on 'Login'

      expect(page).to have_content('You failed to log in!')
      expect(page).to have_current_path(login_path)
    end
  end

end
