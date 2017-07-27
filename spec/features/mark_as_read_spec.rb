require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = User.create(email: "j@j.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    user.links.create(url:"https://turing.io", title:"Turing")
    visit "/"
    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

    within('.link' ) do
      expect(page).to have_button("Mark as Unread")
    end
  end

  scenario "Mark a link as unread" do
    user = User.create(email: "j@j.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    user.links.create(url:"https://turing.io", title:"Turing", read: true)
    visit "/"
    within('.link .read-status') do
      expect(page).to have_text("true")
    end

    click_on "Mark as Unread"

    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    within('.link' ) do
      expect(page).to have_button("Mark as Read")
    end
  end
end
