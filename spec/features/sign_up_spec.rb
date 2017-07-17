require "rails_helper"

RSpec.describe "User can sign up for account", :js => :true do
  scenario "New user visits sight" do
    visit "/"
    expect(path).to have_current_path('/signin')
    expect(page).to have_content('Sign Up')
    click_link('Sign Up')
    expect(path).to have_current_path('/signup')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'Password')
    fill_in('Password Confirmation', with: 'Password')
    click_on('submit')
  end
end
