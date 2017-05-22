require 'rails_helper'

describe "when I visit the root page" do
  context "when I fill in my user information" do
    it "will log me in if the user account exists" do
      user = create(:user)

      visit root_path
      fill_in "session[email]", with: "me@me.com"
      fill_in "session[password]", with: "password"
      click_on "Sign In"

      expect(current_path).to eq(links_path)
      expect(page).to have_content("Welcome: me@me.com")
      expect(page).to have_content ("Sign Out")
      expect(page).to_not have_content("Sign In")

      click_on "Sign Out"

      expect(current_path).to eq(root_path)

      within('.flash') do
        expect(page).to have_content("Logged Out")
      end
    end
  end
end
