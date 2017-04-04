require "rails_helper"

feature 'Unauthenticated user' do
  context 'when the user visits /' do
    scenario 'the user should be redirected to the login/signup page' do
      visit root_path

      expect(page).to have_current_path('/login')
    end
  end
  context 'after the user is redirected' do
    before { visit root_path }
    scenario 'the user should see an email field' do
      
      expect(page).to have_field('email')
    end
  end
end
