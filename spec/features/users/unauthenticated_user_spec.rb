require "rails_helper"

feature 'Unauthenticated user' do
  context 'when the user visits /' do
    scenario 'the user should be redirected to the login/signup page' do
      visit root_path

      expect(page).to have_current_path('/login')
    end
  end
end
