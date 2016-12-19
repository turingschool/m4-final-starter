require 'rails_helper'

RSpec.describe 'User' do
  it 'can log in' do
    create :user, email: 'bcgoss@example.com', password: 'password', password_confirmation: 'password'
    visit root_path

    fill_in 'Email', with: 'bcgoss@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(current_path).to eq(links_path)
  end

  it 'can log out' do
    me = create :user, email: 'bcgoss@example.com', password: 'password', password_confirmation: 'password'
    login(me)

    expect(page).to_not have_content('Log in')

    click_link 'Log out'

    expect(current_path).to eq(login_path)
    expect(page).to_not have_content('Log out')
  end
end
