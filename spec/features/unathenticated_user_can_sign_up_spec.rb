require 'rails_helper'

RSpec.feature "Unathenticated User Can Sign Up", type: :feature do
  it "shows sign up form" do
    visit root_path
    click_on "Sign Up"

    expect(page).to have_field("EmailAddress")
    expect(page).to have_field("Password")
    expect(page).to have_field("PasswordConfirmation")
  end

  xit "allows new user to creat and account" do
    visit new_user_sign_up_path
    fill_in "Email address", with: "jasmin@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign Up"

    user = User.last
    expect(current_user).to eq(user)
    expect(current_path).to eq(links_path)
  end
end
