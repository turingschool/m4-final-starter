require 'rails_helper'

RSpec.feature "Registered User" do
  it "receives successful flash" do
    user = create(:user, email_address: "me@email.com")

    visit '/'

    click_link "Log In"

    expect(current_path).to eq(login_path)

    fill_in "Email address", with: "me@email.com"
    fill_in "Password", with: "password"
    click_button "Log In"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("You have successfuly logged in.")
  end
end
