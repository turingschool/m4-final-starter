require 'rails_helper'

RSpec.describe 'Unauthenticated User' do
  context 'sucessful signup' do
    it 'can sign up' do
      visit root_path

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Login or Sign Up")
      click_on('Create Account')

      expect(current_path).to eq(new_user_path)

      fill_in "user[email_address]", with: "d@d.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on('Create Account')

      expect(current_path).to eq(links_path)
      expect(page).to have_content("Successfully created acount!")
    end
  end

  context 'unsucessful signup' do
    it 'can not sign up if email address has been taken already' do
      create(:user, email_address: 'd@d.com')

      visit new_user_path

      fill_in "user[email_address]", with: "d@d.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on('Create Account')

      expect(page).to have_content('Email address has already been taken')
    end

    it 'can not sign up without an email address' do
      visit new_user_path

      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on('Create Account')

      expect(page).to have_content("Email address can't be blank")
    end

    it 'can not sign up without a password' do
      visit new_user_path

      fill_in "user[email_address]", with: "d@d.com"
      fill_in "user[password_confirmation]", with: "password"
      click_on('Create Account')

      expect(page).to have_content("Password can't be blank")
    end
  end
end
