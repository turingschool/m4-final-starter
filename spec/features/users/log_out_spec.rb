require 'rails_helper'

feature 'Logout' do
  context 'An authenticated user logs out' do
    before do
      logged_in_user
      visit links_path
    end

    scenario 'the user should see a sign out button' do
      expect(page).to have_selector(:link_or_button, 'Sign out')
    end

    scenario 'the user should not see a sign in button' do
      expect(page).to_not have_selector(:link_or_button, 'Sign In')
    end

    scenario 'after signing out the user should be redirected to the login path' do
      click_on 'Sign out'

      expect(page).to have_current_path(login_path)
    end
  end
end
