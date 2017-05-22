require 'rails_helper'

feature 'logged in user' do
  before(:each) do

    user = User.create(email: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  end
  scenario 'sees a link to logout' do

    visit '/links'

    expect(page).to have_link('Sign out', href: '/logout')
    expect(page).to_not have_link('Sign in', href: '/login')
  end
  scenario 'clicks link and is logged out' do

    visit '/links'

    click_link 'Sign out'

    within('.alert') do
      expect(page).to have_content('Successful sign-out. Come back soon')
    end

    expect(current_path).to eq('/guests')
  end
end
