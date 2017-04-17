require "rails_helper"

describe "User read a link", :type => :feature, :js => true do
  it "When a user clicks unread link, read status changes to true" do
    user = create(:user)
    link = create(:link, url: "https://www.google.com", title: "Google", read: false)
    user.links << link

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within(".links") do
      expect(page).to have_content link.title
      expect(page).to have_content link.url
      expect(page).to have_content "Read?: false"
      expect(page).to have_link "Mark as Read"
      expect(page).to have_link "Edit"
    end

    click_link_or_button "Mark as Read"

    expect(current_path).to eq links_path

    within(".links") do
      expect(page).to have_content link.title
      expect(page).to have_content link.url
      expect(page).to have_content "Read?: true"
      expect(page).to have_link "Edit"
    end
  end

  it "When a user clicks read link, read status changes to false" do
    user = create(:user)
    link = create(:link, url: "https://www.google.com", title: "Google", read: false)
    link = create(:link, url: "https://www.google.com", title: "Google", read: false)
    user.links << link

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within(".links") do
      expect(page).to have_content link.title
      expect(page).to have_content link.url
      expect(page).to have_content "Read?: false"
      expect(page).to have_link "Mark as Read"
      expect(page).to have_link "Edit"
    end

    click_link_or_button "Mark as Read"

    expect(current_path).to eq links_path

    within(".links") do
      expect(page).to have_content link.title
      expect(page).to have_content link.url
      expect(page).to have_content "Read?: true"
      expect(page).to have_link "Edit"
    end
  end
end
