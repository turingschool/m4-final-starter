require 'rails_helper'

describe "Links", :type => :feature, :js => true do
  it "posts a link" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    fill_in "title", :with => "Fox News"
    fill_in "url", :with => "http://www.foxnews.com/"
    click_link_or_button "Add Link"

    expect(page).to have_content("Title")
    expect(page).to have_content("URL")
  end

  it "go to edit form from index page and update the links title and url" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path

    fill_in "title", :with => "google"
    fill_in "url", :with => "https://www.google.com/"
    click_link_or_button "Add Link"

    expect(page).to have_content("Title")
    expect(page).to have_content("URL")
  end

end
