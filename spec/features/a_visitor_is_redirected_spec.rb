require 'rails_helper'

describe 'Unauthenticated visitor' do
  describe 'Visits home page' do
    it 'will be redirected to sign in/sign up page' do
      visit root_path

      expect(page).to have_current_path(signin_path)

      expect(page).to have_content('Sign In to URLockbox')
      expect(page).to have_field('email')
      expect(page).to have_field('password')
      expect(page).to have_selector(:link_or_button, 'Sign In')
      expect(page).to have_selector(:link_or_button, 'Sign Up')
      expect(page).to have_link('Sign Up', :href => signup_path)
    end
    it 'will be redirected to sign up page if clicking on Sign Up link' do
      visit root_path

      click_on 'Sign Up'

      expect(page).to have_current_path(signup_path)
      expect(page).to have_content('Sign Up with URLockbox')
      expect(page).to have_field('email')
      expect(page).to have_field('password')
      expect(page).to have_field('password_confirmation')
      expect(page).to have_selector(:link_or_button, 'Sign Up')
    end
  end
end