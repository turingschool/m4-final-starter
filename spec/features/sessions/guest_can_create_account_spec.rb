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
end
