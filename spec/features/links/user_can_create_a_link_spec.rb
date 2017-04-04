require "rails_helper"

describe "User can create a link", :js => :true do
  scenario "When a user enters valid information a link is created" do
    user = create(:user)
    link = create(:link, url: "https://www.google.com/", title: "Google", read: false)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    fill_in :link_title, :with => link.title
    fill_in :link_url, :with => link.url

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
