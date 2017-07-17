require 'rails_helper'

RSpec.describe 'New user registration process' do
  context 'with valid inputs' do
    scenario 'user does not already have account' do
      visit root_path

      expect(current_path).to eq(new_session_path)
      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)
      fill_in('user[email]', with: 'test@test.com')
      fill_in('user[password]', with: 'testpassword')
      fill_in('user[password_confirmation]', with: 'testpassword')
      click_on('Create Account')
      expect(User.count).to eq(1)
      expect(current_path).to eq(root_path)
    end
  end

  context 'with invalid inputs' do
    scenario 'user does not input an email' do
      visit new_user_path

      fill_in('user[password]', with: 'testpassword')
      fill_in('user[password_confirmation]', with: 'testpassword')
      click_on('Create Account')
      expect(User.count).to eq(0)
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Email can't be blank")
    end
  end
end
