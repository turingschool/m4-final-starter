require 'rails_helper'

describe 'User Sign Out' do
  let!(:test_user) {
    test_email = 'test@email.com'
    test_password = 'password'
    test_user = User.create(email: test_email, password: test_password)
  }

  before(:each) do
    visit signin_path

    fill_in 'user[email]', with: test_user.email
    fill_in 'user[password]', with: 'password'
    click_on 'Sign In'
  end

  describe 'Signed in user' do
    it 'has Sign Out link, but no Sign In link' do
      expect(page).to have_selector(:link_or_button, 'Sign Out')
      expect(page).not_to have_selector(:link_or_button, 'Sign In')
    end

    it 'can sign out by clicking on Sign Out link' do
      click_on 'Sign Out'

      expect(page).to have_current_path(signin_path)
      expect(page).not_to have_selector(:link_or_button, 'Sign Out')
    end
  end
end