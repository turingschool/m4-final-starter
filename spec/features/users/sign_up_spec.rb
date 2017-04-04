require 'rails_helper'

feature 'Unauthenticated user' do
  before { visit signup_path }
  context 'the user create an account' do
    scenario 'the user should see a field to enter an email address' do
      expect(page).to have_field('user[email]')
    end

    scenario 'the user should see a password field' do
      expect(page).to have_field('user[password]')
    end

    scenario 'the user should see a password confirmation field' do
      expect(page).to have_field('user[password_confirmation]')
    end
  end
end
