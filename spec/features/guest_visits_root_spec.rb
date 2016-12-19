require 'rails_helper'

RSpec.describe 'Visitor' do
  it 'is offered a login or sign up page' do
    visit root_path
    expect(page).to have_content('Log in')
    expect(page).to have_content('Sign up')
    expect(current_path).to eq(login_path)
  end

  it 'can sign up with an email and password' do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: 'bcgoss@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm Password', with: 'passwor'
    click_button 'Sign up'

    expect(current_path).to eq(links_path)
  end

  xit 'cannot sign up if the email is being used' do

  end

  xit 'cannot sign up if passwords dont match' do

  end


end
