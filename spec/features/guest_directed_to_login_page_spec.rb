require 'rails_helper'

RSpec.feature "as an authenticated user, when I visit '/'" do
  scenario "I should be redirected to login or signup" do
    visit root_path
    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sign up by clicking here")
    expect(page).to_not have_content("Signout")
  end
end
