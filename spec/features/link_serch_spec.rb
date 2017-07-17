require 'spec_helper'

describe "Link search", :type => :feature, :js => true do
  it "search for link" do
    user = User.create(email: "lukyans@gmail.com", password: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit root_path
    fill_in "Url", with: "https://www.google.com/"
    fill_in "Title", with: "google page"
    click_on "Submit"

    fill_in "Url", with: "https://www.twitter.com/"
    fill_in "Title", with: "Twitter"
    click_on "Submit"

    fill_in "Search", with: "twi"

      expect(page).to have_content("https://twitter.com/")
  end
end
