require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = create(:user)
    link = create(:link, user: user)

    page.set_rack_session(user_id: user.id)

    visit links_path

    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    sleep(1)

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

  end
end
