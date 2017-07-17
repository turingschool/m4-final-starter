require 'rails_helper'

RSpec.feature "as a user on the site"  do
  scenario "I can edit link" do
    visit root_path

    click_on "Edit"
    expect(current_path).to eq(link_path(link))
    fill_in :user_email, with: "user@gmail.com"
    fill_in :user_password, with: "123"
    fill_in :user_password_confirmation, with: "123"

    click_on "Submit"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Signup")
  end
end
