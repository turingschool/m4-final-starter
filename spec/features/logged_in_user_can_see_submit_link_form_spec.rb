require 'rails_helper'

RSpec.feature "as an authenticated user" do
  before do
    @user = create(:user)
    visit root_path
    fill_in "email", with: "#{@user.email}"
    fill_in "password", with: "#{@user.password}"
    click_on "Submit"
  end
  scenario "i can see a form to submit a link" do
    expect(current_path).to eq(root_path)

    expect(page).to have_content("URL")
    expect(page).to have_content("Title")
    expect(page).to have_button("Add Link")
  end
end
