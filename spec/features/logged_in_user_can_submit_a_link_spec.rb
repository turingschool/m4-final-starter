require 'rails_helper'

RSpec.feature "as an authenticated user" do
  before do
    @user = create(:user)
    visit root_path
    fill_in "email", with: "#{@user.email}"
    fill_in "password", with: "#{@user.password}"
    click_on "Submit"
  end
  xscenario "i can submit a link" do
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome: #{@user.email}")
    expect(page).to have_content("Signout")

    fill_in "URL", with: "http://youtube.com"
    fill_in "Title", with: "YouTube"

    expect(page).to have_content("...")
    expect(page).to have_content("...")
  end
end
