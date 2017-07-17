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
end
