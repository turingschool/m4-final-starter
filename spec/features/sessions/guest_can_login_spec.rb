require 'rails_helper'

describe 'as a user' do
  context 'when I sign up' do
    visit new_user_path

    fill_in :Name, with: 'Eric'
    fill_in :Email, with: 'sample@email.com'
    fill_in :Password, with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'

    click_on 'Create Account'

    expect(page).to have_content('successfully logged in!')
    expect(current_path).to eq(links_path)
    expect(page).to have_content('Sign Out')
  end
end
