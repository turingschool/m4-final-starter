require "rails_helper"

feature 'Unauthenticated user' do
  context 'when the user visits /' do
    before { visit root_path }
    scenario 'the user should be redirected to the login/signup page' do
      expect(page).to have_current_path('/login')
    end
  end

  context 'after the user is redirected' do
    before { visit root_path }

    scenario 'the user should see an email field' do
      expect(page).to have_field('email')
    end

    scenario 'the user should see a password field' do
      expect(page).to have_field('password')
    end

    scenario 'the user should see a login button' do
      expect(page).to have_selector(:link_or_button, 'Login')
    end

    scenario 'the user should see a option to sign up' do
      expect(page).to have_selector(:link_or_button, 'Sign up')
    end
  end
end
