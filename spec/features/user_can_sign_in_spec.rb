require "rails_helper"

RSpec.describe "user can sign in" do
  scenario "unauthenticated user can register" do

    visit "/"
    expect(current_path).to eq("/login")
    expect(page).to have_content("Register for an account")
    click_on "Register for an account"
    expec(current_path).to eq(new_user_path)

    fill_in "Email", with: "j@j.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Register"

    expect(current_path).to eq(links_path)
  end
end
