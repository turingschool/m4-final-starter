require 'rails_helper'

feature 'guest visits root and clicks Sign Up link' do
  scenario 'guest is redirected to new users path' do
    visit '/'

    click_link 'Sign Up'

    expect(current_path).to eq('/users/new')
  end

  scenario 'guest sees a registration form' do
    visit '/'

    click_link 'Sign Up'

    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
    expect(page).to have_field("Password confirmation")
  end
  scenario 'when guest submits completed form a user is persisted to the database' do
    visit '/'

    click_link 'Sign Up'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button "Register"

    new_user = User.last
    expect(new_user.email).to eq('test@test.com')
  end
end
