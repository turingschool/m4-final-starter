require 'rails_helper'

RSpec.feature "Authenticated User", type: :feature do
  xit "can edit their links" do
    user = create(:user)
    visit links_path
    fill_in "Email", with: "jasmin@turing.io"
    fill_in "Password", with: "password"
    click_button "Log in"

    link = user.links.create(title: "New Link", url: "http://coolstorybro.com")

    save_and_open_page

    within('.user-links') do
      click_link "Edit"
    end

    expect(current_path).to eq(edit_link_path)

    fill_in "Title", with: "Updated Link"
    fill_in "Url", with: "http//lamestorybro.com"
    click_button "Update Link"

    expect(link.title).to eq("Updated Link")
    expect(link.url).to eq("http//lamestorybro.com")
    expect(current_path).to eq(links_path)
    expect(page).to have_content("Successfully updated link")
  end
end
