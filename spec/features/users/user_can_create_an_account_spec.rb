require 'rails_helper'

describe "When a user visits the new user page" do
  scenario "they can create an account if they enter valid information" do
    visit new_user_path
    
    fill_in :user_email, :with => "david@gmail.com"
    fill_in :user_password, :with => "123"
    fill_in :user_password_confirmation, :with => "123"

    click_on "Create User"

    expect(current_path).to eq links_path
    expect(page).to have_content "You've successfully created a new Account!"
    expect(User.count).to eq 1
    expect(User.first.email).to eq "david@gmail.com"
  end

  scenario "they remain on the same page if they enter an invalid email" do
    create(:user, email: "david@gmail.com")

    visit new_user_path
    
    fill_in :user_email, :with => "david@gmail.com"
    fill_in :user_password, :with => "123"
    fill_in :user_password_confirmation, :with => "123"

    click_on "Create User"
    expect(page).to have_content "Email has already been taken"
  end

  scenario "they remain on the same page if password and password confirmation do not match" do
    visit new_user_path
    
    fill_in :user_email, :with => "david@gmail.com"
    fill_in :user_password, :with => "123"
    fill_in :user_password_confirmation, :with => "789"

    click_on "Create User"

    expect(page).to have_content "Password confirmation doesn't match"
  end

  scenario "they remain on the same page if they enter an invalid email" do
    create(:user, email: "david@gmail.com")

    visit new_user_path
    
    fill_in :user_email, :with => "david@gmail.com"
    fill_in :user_password, :with => "123"
    fill_in :user_password_confirmation, :with => "123"

    click_on "Create User"

    expect(page).to have_content "Email has already been taken"
  end

  scenario "they remain on the same page if email is blank" do
    visit new_user_path
    
    fill_in :user_password, :with => "123"
    fill_in :user_password_confirmation, :with => "123"

    click_on "Create User"

    expect(page).to have_content "Email can't be blank"
  end

  scenario "they remain on the same page if password is blank" do
    visit new_user_path
    
    fill_in :user_email, :with => "david@gmail.com"
    fill_in :user_password_confirmation, :with => "123"

    click_on "Create User"

    expect(page).to have_content "Password can't be blank"
  end
end