require 'rails_helper'

describe "When a user visits the new user page" do
  scenario "they can create an account" do
    visit new_user_path
    
    fill_in :email, :with => "david@gmail.com"
    fill_in :password, :with => "123"
    fill_in :password_confirmation, :with => "123"

    click_on "Create Account"

    expect(current_path).to eq links_path
  end
end