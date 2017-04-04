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

    scenario 'the user should see a sign me up button' do
      expect(page).to have_selector(:link_or_button, 'Sign me up!')
    end

    scenario 'after signing up the user should see a successfully signed up message' do
     fill_in 'user[email]' , with: 'Rick James'
     fill_in 'user[password]', with: 'What!'
     fill_in 'user[password_confirmation]', with: 'What!'

     click_on 'Sign me up!'

     expect(page).to have_content("You've successfully signed up!")
    end

    scenario 'after signing up the user should be redirected to the root path' do
     fill_in 'user[email]' , with: 'Rick James'
     fill_in 'user[password]', with: 'What!'
     fill_in 'user[password_confirmation]', with: 'What!'

     click_on 'Sign me up!'

     expect(page).to have_current_path('/links')
    end
  end
end
