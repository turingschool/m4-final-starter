require 'rails_helper'

describe "When a user visits the login page" do
  scenario "they can login if they enter valid information" do
    user = create(:user)

    visit login_path

    fill_in :email, :with => user.email
    fill_in :password, :with => user.password

    click_on "Login"

    expect(current_path).to eq links_path
    expect(page).to have_content "You've successfully logged in!"
  end

  scenario "they stay on the same page if they enter an invalid email" do
    visit login_path

    fill_in :email, :with => "david@gmail.com"
    fill_in :password, :with => "123"

    click_on "Login"

    expect(current_path).to eq login_path
    expect(page).to have_content "You've entered an invalid user/password combination"
  end

  scenario "they stay on the same page if they don't enter a password" do
    visit login_path

    fill_in :email, :with => "david@gmail.com"

    click_on "Login"

    expect(current_path).to eq login_path
    expect(page).to have_content "You've entered an invalid user/password combination"
  end
end