require 'rails_helper'

describe "When a user visits the new user page" do
  scenario "they can create an account" do
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
end