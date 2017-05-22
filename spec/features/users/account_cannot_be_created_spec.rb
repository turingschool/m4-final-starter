require 'rails_helper'

RSpec.feature "Invalid information" do
  it "cannot be created with duplicate email" do
    user_1 = create(:user, email_address: "user@email.com")

    visit new_user_path

    fill_in "Email address", with: "user@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create account"
    save_and_open_page
    expect(page).to have_content("Email address has already been taken")
    expect(current_path).to eq(new_user_path)
  end
end
