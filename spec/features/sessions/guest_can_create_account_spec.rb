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
      it 'I am directed to the new user path' do
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
  end
end
