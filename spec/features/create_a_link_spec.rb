require 'rails_helper'

describe "Links", :type => :feature, :js => true do
  it "posts a link" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    fill_in "title", :with => "google"
    fill_in "url", :with => "https://www.google.com/"
    click_link_or_button "Add Link"

    expect(page).to have_content("google")
    expect(page).to have_content("https://www.google.com/")
  end

  it "go to edit form from index page and update the links title and url" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path

    fill_in "title", :with => "google"
    fill_in "url", :with => "https://www.google.com/"
    click_link_or_button "Add Link"

    click_on "Edit"
    expect(current_path).to eq(edit_link_path(Link.last))

    fill_in "link[title]", :with => "yahoo"
    fill_in "link[url]", :with => "https://www.yahoo.com/"
    click_on "Update Link"
    expect(Link.last.title).to eq("yahoo")
    expect(Link.last.url).to eq("https://www.yahoo.com/")
  end

end
