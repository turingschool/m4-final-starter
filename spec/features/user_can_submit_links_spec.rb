require "rails_helper"

RSpec.describe "user can submit a link", :js => :true do
  scenario "User can submit a url" do

    user = User.create(email: "j@j.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    within('.link_form') do
      expect(page).to have_content("Url")
      expect(page).to have_content("Title")
      expect(page).to have_button("Add Link")
    end

    fill_in "Url", with: "https://turing.io"
    fill_in "Title", with: "Turing"
    click_on "Add Link"
    expect(page).to have_content "Title: Turing"
    expect(page).to have_content "URL: https://turing.io"
    expect(page).to have_content "Read?: false"
  end

  scenario "User cannot submit without title" do
    user = User.create(email: "j@j.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    fill_in "Url", with: "https://turing.io"
    click_on "Add Link"
    expect(page).to have_content "Title can't be blank"
    expect(page).to_not have_content "Title: Turing"
    expect(page).to_not have_content "URL: https://turing.io"
    expect(page).to_not have_content "Read?: false"
  end

  scenario "User cannot submit without url" do
    user = User.create(email: "j@j.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    fill_in "Title", with: "Turing"
    click_on "Add Link"
    expect(page).to have_content "Url can't be blank"
    expect(page).to_not have_content "Title: Turing"
    expect(page).to_not have_content "URL: https://turing.io"
    expect(page).to_not have_content "Read?: false"
  end

  scenario "User cannot without valid url" do
    user = User.create(email: "j@j.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    fill_in "Title", with: "Turing"
    fill_in "Url", with: "turing.io"
    click_on "Add Link"
    expect(page).to have_content "Url Must be a valid url"
    expect(page).to_not have_content "Title: Turing"
    expect(page).to_not have_content "URL: turing.io"
    expect(page).to_not have_content "Read?: false"
  end


end
