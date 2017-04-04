require 'rails_helper'

describe 'Registered user Sign In' do
  describe 'When credentials are properly entered' do
    it 'can sign in successfully' do
      test_email = 'test@email.com'
      test_password = 'password'

      visit signin_path

      fill_in 'user[email]', with: test_email
      fill_in 'user[password]', with: test_password
      click_on 'Sign In'

      expect(page).to have_current_path(links_path)
      expect(page).to have_content('Successful sign in!')
    end
  end
end