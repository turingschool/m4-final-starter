require 'rails_helper'

describe "When a user visits their links index page" do
  scenario "they can see all of their links" do
    user = create(:user)
    user.links << create(:link, title: "David")
    user.links << create(:link, title: "John")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within(".links") do
      expect(page).to have_content "Title: David"
      expect(page).to have_content "Title: John"
    end
  end
end