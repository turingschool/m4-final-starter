require 'rails_helper'

feature 'registered user signs in' do
  before(:each) do
    User.create(email: 'test@test.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'registered user signs in successfully' do
    visit '/'

    click_link 'Log In'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'

    expect(current_path).to eq('/links/index')

    within('.alert') do
      expect(page).to have_content('Successful Login. Welcome!')
    end
  end
end
