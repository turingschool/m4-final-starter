require 'rails_helper'

describe "When a user clicks the edit button on a link" do
  scenario "they are redirected to an edit page for the given link" do
    user = create(:user)
    link1 = create(:link, title: "David")
    link2 = create(:link, title: "John")
    user.links << link1
    user.links << link2 

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    click_link_or_button "Edit", match: :first

    expect(current_path).to eq edit_link_path(link2)

    fill_in :link_title, :with => "Paul"

    click_on "Update Link"

    expect(current_path).to eq links_path

    within(".links") do
      expect(page).to_not have_content "Title: John"
      expect(page).to have_content "Title: Paul"
      expect(page).to have_content "Title: David"
    end
  end
end