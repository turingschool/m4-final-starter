require 'rails_helper'

describe "When a user visits links index page" do
  scenario "they are redirected to the root path if they're not logged in" do
    visit links_path

    expect(current_path).to eq root_path
    expect(page).to have_content "Please login first"
  end
end