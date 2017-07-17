require 'rails_helper'

RSpec.feature "as a user on the site"  do
  scenario "I can edit link" do
    visit root_path

    click_on "Edit"
    expect(current_path).to eq(link_path(link))

    fill_in "url[url]", with: "https://www.google.com/"
    fill_in "title[title]", with: "google"

    click_on "Edit Link"

    expect(current_path).to eq(link_path)
    expect(page).to have_content("https://www.google.com/")
    expect(page).to have_content("google")
  end
end
