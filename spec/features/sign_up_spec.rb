require "rails_helper"

RSpec.describe "User can sign up for account", :js => :true do
  scenario "New user visits site" do
    visit "/"
    expect(page).to have_current_path('/login')
    expect(page).to have_content('Sign Up')
    click_link('Sign Up')
    expect(page).to have_current_path('/signup')
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: 'Password')
    fill_in('user[password_confirmation]', with: 'Password')
    click_on('Submit')
  end

  scenario "Cannot create user with same email or bad confirm" do
    user = create(:user)
    visit "/"
    expect(page).to have_current_path('/login')
    expect(page).to have_content('Sign Up')
    click_link('Sign Up')
    expect(page).to have_current_path('/signup')
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: 'pass')
    fill_in('user[password_confirmation]', with: 'notPass')
    click_on('Submit')
    expect(page).to have_current_path('/signup')
    expect(page).to have_content('Email is already in use')
    expect(page).to have_content("doesn't match")
  end

  scenario "Cannot leave fields blank" do
    user = create(:user)
    visit "/"
    expect(page).to have_current_path('/login')
    expect(page).to have_content('Sign Up')
    click_link('Sign Up')
    expect(page).to have_current_path('/signup')
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password_confirmation]', with: 'notPass')
    click_on('Submit')
    expect(page).to have_current_path('/signup')
    expect(page).to have_content('cannot be blank')
  end
end
