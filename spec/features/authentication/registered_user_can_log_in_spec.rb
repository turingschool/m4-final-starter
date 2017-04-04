require 'rails_helper'

RSpec.feature 'Registered user logs in' do
  before(:each) do
    @user = create(:user)
    visit login_path
  end

  context 'successful login' do
    it 'they can login with correct credentials' do
      within("form") do
        fill_in 'email_address', with: @user.email_address
        fill_in 'password', with: @user.password
        click_on 'Login'
      end

      expect(page).to have_content('Successfully logged in!')
    end
  end

  context 'unsuccessful login' do
    it 'they can not login with invalid credentials' do
      within("form") do
        fill_in 'email_address', with: @user.email_address
        fill_in 'password', with: 'notpassword'
        click_on 'Login'
      end

      expect(page).to have_content('Failed to login!')
    end
  end
end
