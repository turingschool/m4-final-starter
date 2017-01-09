require "rails_helper"

feature "User can sign in" do
  before do
    User.create(email: "rsbarbo@example.com", password: "password")
  end

  scenario "user provides valid information while logging in" do

    visit root_path

    fill_in :email, with: "rsbarbo@example.com"
    fill_in :password, with: "password"
    click_button "Submit"

    expect(current_path).to eq links_path
  end
end
