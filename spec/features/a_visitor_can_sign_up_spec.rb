require 'rails_helper'

describe 'New user Sign Up' do
  describe 'All user details submitted' do
    it 'will create account for new user and redirect to links index page' do
      # As an unauthenticated user, if I click "Sign Up", I should be taken to a form where I can enter an email address, a password, and a password confirmation.
      # I cannot sign up with an email address that has already been used.
      # I cannot sign up without an email address and a password.
      # Password and confirmation must match.
      # If criteria is not met the user should be given a message to reflect the reason they could not sign up.
      # Upon submitting this information, I should be logged in and redirected to the "Links Index" page.
      test_email = 'test@email.com'
      test_password = 'password'

      visit root_path

      click_on 'Sign Up'

      fill_in 'user[email]', with: test_email
      fill_in 'user[password]', with: test_password
      fill_in 'user[password_confirmation]', with: test_password
      click_on 'Sign Up'

      db_user = User.find(1)

      expect(User.count).to eq(1)
      expect(db_user.email).to eq(test_email)
      expect(page).to have_current_path(links_path)
    end
  end

  describe 'User detail validation with error messages' do
    it 'will fail if email is already registered' do
      test_email = 'test@email.com'
      test_password = 'password'
      test_existing_user = User.create(email: test_email, password: test_password)

      visit signup_path

      fill_in 'user[email]', with: test_email
      fill_in 'user[password]', with: test_password
      fill_in 'user[password_confirmation]', with: test_password
      click_on 'Sign Up'

      expect(User.count).to eq(1)
      expect(page).to have_current_path(signup_path)
      expect(page).to have_content('Email has already been taken')
    end
  end
end