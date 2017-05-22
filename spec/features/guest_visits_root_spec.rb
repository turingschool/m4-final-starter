require "rails_helper"


feature 'guest visits root' do
  scenario 'guest is redirected to login/signup page' do
    visit '/'

    expect(current_path).to eq('/guests')
  end

  scenario '/guests prompts guest to log-in or sign up' do
    visit '/'

    within('#guest-message') do
      expect(page).to have_content('Log In or Sign Up')
    end
  end
  scenario 'guest sees links to login and signup' do
    visit '/'

    expect(current_path).to eq('/guests')

    expect(page).to have_link('Sign Up', href: '/users/new')
    expect(page).to have_link('Log In', href: '/sessions/new')
  end
end
