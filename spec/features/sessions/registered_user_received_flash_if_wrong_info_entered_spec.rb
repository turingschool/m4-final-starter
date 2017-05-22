require 'rails_helper'

RSpec.feature "Registered User" do
  it "received warning flash if wrong info entered" do
    user = create(:user, email_address: "me@email.com")

    visit '/'

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in "Email address", with: "me@email.com"
    fill_in "Password", with: "pass"
    click_button "Log In"

    expect(page).to have_content("Your login information is incorrect.")
  end
end
