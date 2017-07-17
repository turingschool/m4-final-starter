require "rails_helper"

RSpec.describe "user can sign in" do
  scenario "unauthenticated user can register" do

    visit "/"
    expect(current_path).to eq("/signup")
    expect(page).to have_content("Register for an account")
    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    fill_in "Email", with: "j@j.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Register"

    expect(current_path).to eq(links_path)
  end
end
