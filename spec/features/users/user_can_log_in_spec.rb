require 'rails_helper'

describe "user goes through the logging in process" do
  before do
    User.create(email:'jason@conrad.com', password: 'password' )
  end
  scenario "user correctly fills in the information" do

    visit "/login"

    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")
    expect(page).to have_button("Submit")

    fill_in "email", with: 'jason@conrad.com'
    fill_in "password", with: 'password'

    click_on ("Submit")

    expect(page).to have_content("You have successfully logged in.")
    expect(page).to have_content("Logout")
  end

  scenario "user incorrectly fills in the information" do

    visit "/login"

    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")
    expect(page).to have_button("Submit")

    fill_in "email", with: 'jason@conrad.com'
    fill_in "password", with: 'whatsup'

    click_on ("Submit")

    expect(page).to have_content("You have entered in some incorrect information, please try again.")
  end
end
