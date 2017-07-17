require 'rails_helper'

RSpec.feature "as a guest on the site" do
  scenario "i can register a new account" do

    visit root_path

    click_on "Register"

    expect(current_path).to eq(signup_path)

    fill_in :user_email, with: "janedoe@janedoe.com"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_on "Submit"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome: janedoe@janedoe.com")
    expect(page).to_not have_content("Register")
    expect(page).to have_content("links index")
  end

  scenario "am notified when my registration fails" do
    user1 = create(:user, email: "jane@janedoe.com", password: "password")

    visit root_path

    click_on "Register"

    expect(current_path).to eq(signup_path)

    fill_in :user_email, with: "janedoe@janedoe.com"
    fill_in :user_password, with: "password"
    fill_in :user_password_confirmation, with: "1234"
    click_on "Submit"

    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Sorry, but that email has already been taken.")
  end
end
