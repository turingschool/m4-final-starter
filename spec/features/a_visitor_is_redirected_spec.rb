require 'rails_spec'

describe 'Unauthenticated visitor' do
  describe 'Visits home page' do
    it 'will be redirected to sign in/sign up page' do
      # As an unauthenticated user, when I visit /, I should be redirected to a page which prompts me to "Log In or Sign Up".
      visit root_path

      expect(page).to have_current_path(sign_in_path)
    end
  end
end