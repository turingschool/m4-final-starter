require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = create(:user)
    link = create(:link, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path
    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

  end
end
