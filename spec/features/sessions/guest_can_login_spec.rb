require 'rails_helper'

describe 'guest creates an account' do
  context 'as a guest' do
    describe 'when I visit /' do
      it 'I am redirected to the login path' do
        visit root_path

        expect(current_path).to eq login_path
        expect(page).to have_content 'Login'
        expect(page).to have_content "Don't have an account? Click here to make one!"
        expect(page).to have_link 'here', href: new_user_path
        expect(page).to have_field "Email"
        expect(page).to have_field "Password"
        expect(page).to have_button "Submit"
      end
    end
  end


  # fill_in :Name, swith: 'Eric'
  # fill_in :Email, with: 'sample@email.com'
  # fill_in :Password, with: 'password'
  # fill_in 'user[password_confirmation]', with: 'password'
  #
  # click_on 'Create Account'
  #
  # expect(page).to have_content('successfully logged in!')
  # expect(current_path).to eq(links_path)
  # expect(page).to have_content('Sign Out')
end
