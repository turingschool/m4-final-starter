require "rails_helper"

RSpec.describe "user can submit a link", :js => :true do
  scenario "User can edit a url" do
    user = User.create(email: "j@j.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    link = user.links.create(title: "Turing", url: "https://turing.io")

    visit "/"
    within('.link') do
      click_on "Edit"
    end

    expect(current_path).to eq(edit_link_path(link))

    fill_in "Url", with: "https://amazon.com"
    fill_in "Title", with: "Turing"
    click_on "Edit Link"

    expect(current_path).to eq(links_path)
    # expect(page).to have_content "Title: Turing"
    # expect(page).to have_content "URL: https://turing.io"
    expect(page).to have_content "Read?: false"
  end

  scenario "User can edit a title" do
    user = User.create(email: "j@j.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    link = user.links.create(title: "Turing", url: "https://turing.io")

    visit "/"
    within('.link') do
      click_on "Edit"
    end

    expect(current_path).to eq(edit_link_path(link))

    fill_in "Url", with: "https://amazon.com"
    fill_in "Title", with: "Books"
    click_on "Edit Link"

    expect(current_path).to eq(links_path)
    # expect(page).to have_content "Title: Turing"
    # expect(page).to have_content "URL: https://turing.io"
    expect(page).to have_content "Read?: false"
  end
end
