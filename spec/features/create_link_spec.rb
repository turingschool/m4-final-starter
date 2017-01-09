require "rails_helper"

RSpec.describe "can create links", :js => :true do
  before(:each) do
    user_login
  end

  scenario "Create a new link" do
    fill_in "link-title", :with => "Turing"
    fill_in "link-url", :with => "http://turing.io"
    click_on "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
    end

  end
end
