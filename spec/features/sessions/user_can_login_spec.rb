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
end