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
end
