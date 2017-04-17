require 'rails_helper'

describe "logging out" do
  before do
    User.create(email:'jason@conrad.com', password: 'password' )
  end

  scenario "user logs out" do
    visit "/login"

    fill_in "email", with: 'jason@conrad.com'
    fill_in "password", with: 'password'

    click_on ("Submit")

    expect(page).to have_content("Logout")

    click_on  "Logout"

    expect(page).to have_content("You have successfully logged out.")
  end
end
