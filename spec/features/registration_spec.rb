require 'rails_helper'

RSpec.describe 'New user registration process' do
  context 'as a user who does not already have an account' do
    scenario 'with valid inputs' do
      visit root_path

      expect(current_path).to eq(new_session_path)
      click_on 'Sign Up'
      expect(current_path).to eq(new_user_path)
      fill_in('Email', with: 'test@test.com')
      fill_in('Password', with: 'testpassword')
      fill_in('Confirm Password', with: 'testpassword')
      click_on('Submit')
      expect(current_path).to eq(root_path)
    end
  end
end
