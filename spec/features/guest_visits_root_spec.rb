require "rails_helper"


feature 'guest visits root' do
  scenario 'guest is redirected to login/signup page' do
    visit '/'

    expect(current_path).to eq('/guests')
  end

  scenario '/guests prompts guest to log-in or sign up' do
    visit '/'

    expect(current_path).to eq('/guests')

    within('#guest-message') do
      expect(page).to have_content('Log In or Sign Up')
    end
  end
end
