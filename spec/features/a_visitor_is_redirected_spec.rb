require 'rails_helper'

describe 'Unauthenticated visitor' do
  describe 'Visits home page' do
    it 'will be redirected to sign in/sign up page' do
      # As an unauthenticated user, when I visit /, I should be redirected to a page which prompts me to "Log In or Sign Up".
      visit root_path

      expect(page).to have_current_path(signin_path)
      expect(page).to have_content('Sign In to URLockbox')
      expect(page).to have_field('email')
      expect(page).to have_field('password')
      expect(page).to have_selector(:link_or_button, 'Sign In')
      expect(page).to have_selector(:link_or_button, 'Sign Up')
      expect(page).to have_link('Sign Up', :href => signup_path)
    end
  end
end