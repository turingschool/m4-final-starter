require 'rails_helper'

RSpec.feature "Registered User" do
  it "can logout" do
    user = create(:user, email_address: "me@email.com")

    visit '/'

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in "Email address", with: "me@email.com"
    fill_in "Password", with: "password"
    click_button "Log In"

    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Log In")

    click_link "Logout"

    expect(page).to have_content("Log In")
    expect(page).to_not have_content("Logout")
  end
end
