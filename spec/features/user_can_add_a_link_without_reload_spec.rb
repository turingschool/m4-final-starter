require 'spec_helper'

describe "Add Link", :type => :feature, :js => true do
  let!(:link) { FactoryGirl.create(:link) }

  it "posts a new link" do
    visit root_path
    fill_in "url", :with => "http://airbnb.com"
    fill_in "title", :with => "AirBnB"
    click_link_or_button "Add Link"
    within(".my_link") do
      expect(page).to have_content("http://airbnb.com")
      expect(page).to have_content("AirBnB")
    end
  end
end
