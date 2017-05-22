require 'rails_helper'

RSpec.feature "Invalid information" do
  it "cannot be created if email has already been taken" do
    user_1 = create(:user, email_address: "user@email.com")

    visit new_user_path

    fill_in "Email address", with: "user@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create account"

    expect(page).to have_content("Email address has already been taken")
    expect(current_path).to_not eq(links_path)
  end

  it "cannot be created if passwords don't match" do

    visit new_user_path

    fill_in "Email address", with: "me@email.com"
    fill_in "Password", with: "passwo"
    fill_in "Password confirmation", with: "password"
    click_button "Create account"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it "cannot be created if password was not provided" do

    visit new_user_path

    fill_in "Email address", with: "me@email.com"
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_button "Create account"

    expect(page).to have_content("Password can't be blank and Password can't be blank")
  end

  it "cannot be created without an email" do

    visit new_user_path

    fill_in "Email address", with: ""
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create account"

    expect(page).to have_content("Email address can't be blank")
  end

  it "cannot be created without an email and password" do

    visit new_user_path

    fill_in "Email address", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_button "Create account"

    expect(page).to have_content("Password can't be blank, Password can't be blank, and Email address can't be blank")
  end
end
