require "rails_helper"

RSpec.describe "user can submit a link", js: => :true do
  scenario "User can submit a url" do

    user = User.create(email: "j@j.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    within('.link_form') do
      expect(page).to have_content("URL:")
      expect(page).to have_content("Title:")
      expect(page).to have_content("Add Link")
    end

    fill_in "Url", with: "https://turing.io"
    fill_in "Title", with: "Turing"
    click_on "Add Link"
    expect(page).to have_content "Title: Turing"
    expect(page).to have_content "URL: https://turing.io"
    expect(page).to have_content "Read?: false"
  end
end
