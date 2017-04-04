require "rails_helper"

describe "User can create a link", :js => :true do
  scenario "When a user enters valid information a link is created" do
    link = create(:link, url: "https://www.google.com/", title: "Google", read: false)

    fill_in :url, :with => link.url
    fill_in :title, :with => link.title

    click_on "Add Link"

    within ".link", match: :first do
      expect(page).to have_content "Title: #{link.title}"
      expect(page).to have_content "URL: #{link.url}"
      expect(page).to have_content "Read?: false"
      expect(page).to have_button "Mark as Read"
      expect(page).to have_button "Edit"
    end
  end
end
