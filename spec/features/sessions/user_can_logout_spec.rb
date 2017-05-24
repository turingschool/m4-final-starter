require 'rails_helper'

describe "When a user visits the links index page" do
  scenario "they can sign out" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    click_on "Sign Out"

    expect(current_path).to eq root_path
    expect(page).to have_link "Login"
    expect(page).to have_link "Create Account"
  end
end