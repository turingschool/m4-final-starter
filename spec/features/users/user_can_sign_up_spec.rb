require 'rails_helper'

describe "user visits the login page" do
  scenario "user can sees the required fields for signing up" do
    visit "/signup"

    expect(page).to have_content("Signup for URL-Lockbox!")
    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")
    expect(page).to have_content("Password Confirmation:")
    expect(page).to have_button("Submit")
  end

  scenario "the user correctly signs up" do
    visit "/signup"

    expect(page).to have_content("Signup")
    # expect(page).to have_content("Login")

    fill_in "user[email]", with: "jason@conrad.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"

    click_on "Submit"

    expect(page).to have_content("You have successfully signed up!")
  end

  context "the users incorrectly signs up" do
    it "returns the correct flash message for a missing email" do
      visit "/signup"


      fill_in "user[email]", with: ""
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"

      click_on "Submit"

      expect(page).to have_content("Uh oh, you forgot to enter an email address!")
    end

    it "returns the correct flash message for a missing password" do
      visit "/signup"


      fill_in "user[email]", with: "jason@conrad.com"
      fill_in "user[password]", with: ""
      fill_in "user[password_confirmation]", with: "password"

      click_on "Submit"

      expect(page).to have_content("Uh oh, you forgot to enter a password!")
    end

    it "returns the correct flash message for a missing password confirmation" do
      visit "/signup"


      fill_in "user[email]", with: "jason@conrad.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: ""

      click_on "Submit"

      expect(page).to have_content("Uh oh, you forgot to enter the password confirmation!")
    end

    it "returns the correct flash message for a missing password and password confirmation" do
      visit "/signup"


      fill_in "user[email]", with: "jason@conrad.com"
      fill_in "user[password]", with: ""
      fill_in "user[password_confirmation]", with: ""

      click_on "Submit"

      expect(page).to have_content("Uh oh, you forgot to enter a password and password confirmation!")
    end

    it "returns the correct flash message when the passwords do not match" do
      visit "/signup"


      fill_in "user[email]", with: "jason@conrad.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "passw0rd"

      click_on "Submit"

      expect(page).to have_content("Uh oh, your passwords don't match!")
    end

    it "returns the correct flash message if nothing is filled in" do
      visit "/signup"


      fill_in "user[email]", with: ""
      fill_in "user[password]", with: ""
      fill_in "user[password_confirmation]", with: ""

      click_on "Submit"

      expect(page).to have_content("Uh oh, you didn't enter any information!")
    end
  end
end
