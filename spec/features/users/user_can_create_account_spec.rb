require 'rails_helper'

describe "when a user visits the root page, and they click on sign up" do
  scenario "they are taken to a form where they can create an account" do
    visit root_path
    click_on "Sign Up"
    expect(current_path).to eq(new_user_path)

    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "test"
    fill_in "user[password_confirmation]", with: "test"
    click_on "Create Account"

    expect(current_path).to eq(links_path)
    expect(page).to_not have_content("Sign Up")
    within ('.flash') do
      expect(page).to have_content("Welcome: test@test.com")
    end
  end

  context "they are unable to create an account without a complete form" do
    it "they are unable to create an account without an e-mail" do
      visit new_user_path

      fill_in "user[password]", with: "test"
      fill_in "user[password_confirmation]", with: "test"
      click_on "Create Account"

      expect(current_path).to_not eq(links_path)
      within ('.flash') do
        expect(page).to have_content("Please enter an e-mail address.")
      end
    end
    it "they are unable to create an account without a password" do
      visit new_user_path

      fill_in "user[email]", with: "test@test.com"
      fill_in "user[password_confirmation]", with: "test"
      click_on "Create Account"

      expect(current_path).to_not eq(links_path)
      within ('.flash') do
        expect(page).to have_content("Please enter a password.")
        expect(page).to have_content("Your password and password confirmation do not match.")
      end
    end
    it "they are unable to create an account without a password confirmation" do
      visit new_user_path

      fill_in "user[email]", with: "test@test.com"
      fill_in "user[password]", with: "test"
      click_on "Create Account"

      expect(current_path).to_not eq(links_path)
      within ('.flash') do
        expect(page).to have_content("Please enter a password confirmation.")
        expect(page).to have_content("Your password and password confirmation do not match.")
      end
    end
    it "they are unable to create an account if password confirmation does not match" do
      visit new_user_path

      fill_in "user[email]", with: "test@test.com"
      fill_in "user[password]", with: "test"
      fill_in "user[password_confirmation]", with: "oops"
      click_on "Create Account"

      expect(current_path).to_not eq(links_path)
      within ('.flash') do
        expect(page).to have_content("Your password and password confirmation do not match.")
      end
    end
    it "they are unable to create an account without filling out any field" do
      visit new_user_path

      click_on "Create Account"

      expect(current_path).to_not eq(links_path)
      within ('.flash') do
        expect(page).to have_content("Please enter an e-mail address.")
        expect(page).to have_content("Please enter a password.")
        expect(page).to have_content("Please enter a password confirmation.")
      end
    end
    it "they are unable to create an account with an email address already associated with a user" do
      visit new_user_path

      fill_in "user[email]", with: "test@test.com"
      fill_in "user[password]", with: "test"
      fill_in "user[password_confirmation]", with: "test"
      click_on "Create Account"

      expect(current_path).to eq(links_path)
      expect(page).to_not have_content("Sign Up")
      within ('.flash') do
        expect(page).to have_content("Welcome: test@test.com")
      end

      click_on "Sign Out"
      click_on "Sign Up"

      fill_in "user[email]", with: "test@test.com"
      fill_in "user[password]", with: "test"
      fill_in "user[password_confirmation]", with: "test"
      click_on "Create Account"

      within ('.flash') do
        expect(page).to have_content("An account already exists using this e-mail address.")
      end
    end
  end
end
