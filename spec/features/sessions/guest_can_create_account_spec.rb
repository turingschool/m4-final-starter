require 'rails_helper'

describe 'guest creates an account' do
  context 'as a guest' do
    describe 'when I visit /' do
      it 'I am redirected to the login path' do
        visit root_path

        expect(current_path).to eq login_path
        expect(page).to have_content 'Login'
        expect(page).to have_content "Don't have an account?"
        expect(page).to have_link 'Click here to make one!', href: new_user_path
        expect(page).to have_field 'Email'
        expect(page).to have_field 'Password'
        expect(page).to have_button 'Submit'
      end
    end

    describe 'when I click sign up link' do
      it 'I am redirected to the new user path' do
        visit login_path

        click_on 'Click here to make one!'

        expect(current_path).to eq new_user_path
        expect(page).to have_content 'Signup!'
        expect(page).to have_content 'Already a user?'
        expect(page).to have_link 'Log in by clicking here', href: login_path
        expect(page).to have_field 'user_email'
        expect(page).to have_field 'user_password'
        expect(page).to have_field 'user_password_confirmation'
        expect(page).to have_button 'Submit'
      end
    end

    describe 'when I fill out sign up form' do
      before do
        visit new_user_path

        fill_in 'user_email', with: 'sample@email.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_on 'Submit'
      end

      it 'I get redirected to links index page' do
        expect(current_path).to eq links_path
      end

      it 'I am added to the db' do
        expect(User.count).to eq 1
      end
    end
  end
end
