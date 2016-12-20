require 'rails_helper'

RSpec.feature "Authenticated User", type: :feature do
  xit "can submit a new link" do
    user = create(:user)
    visit links_path
    fill_in "Email", with: "jasmin@turing.io"
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(Link.count).to eq(0)

    fill_in "Title", with: "Test Link"
    fill_in "Url", with: "http://coolnewlink.com"
    click_button "Add Link"

    # expect(Link.count).to eq(1)
    expect(page).to have_content("Successfully added new link")
  end
end
