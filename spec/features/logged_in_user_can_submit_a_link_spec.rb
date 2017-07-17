require 'rails_helper'

RSpec.feature "as an authenticated user" do
  before do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  scenario "i can submit a link" do
    visit root_path
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome: #{@user.email}")
    expect(page).to have_content("Signout")

    fill_in "link[url]", with: "http://youtube.com"
    fill_in "link[title]", with: "YouTube"
    click_on "Add Link"

    expect(page).to have_content("Link saved successfully")

    within(".my_links") do
      expect(page).to have_content("Title: YouTube")
      expect(page).to have_content("URL: http://youtube.com")
      expect(page).to have_content("Read?: false")
    end
  end
end
