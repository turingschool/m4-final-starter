require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  before(:each) do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    link = Link.create(url:"https://turing.io", title:"Turing")
    user.links << link
  end
  scenario "Mark a link as read" do
    visit "/"
    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

  end
end


# Mark a link as "read" or "unread"
#
# There is some JS already written to help you mark a link as read.
#
# Next to each unread link I should see an option to "Mark as Read".
# Clicking this should visibly change the read status to true, and the change should persist.
# Next to each read link I should see an option to "Mark as Unread".
# Clicking this should change the read status to false, and the change should persist.
# Read links should be stylistically differentiated from unread links. You could gray them out or use a strike through or anything you think appropriately informs the user that their link is read or unread.
