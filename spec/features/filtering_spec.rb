require "rails_helper"


RSpec.describe "Filtering: ", :js => :true do
  before(:each) do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    link = Link.create(url:"https://turing.io", title:"Turing")
    link2 = Link.create(url:"https://www.google.com", title:"Google")
    link3 = Link.create(url:"https://www.yahoo.com", title:"Yahoo", read: true)
    user.links << [link, link2, link3]
  end
  scenario "filter by clicking on show read" do
    visit "/"
    click_on('Show Read')
    expect(page).to have_content('Yahoo')
    expect(page).to_not have_content('Turing')
    expect(page).to_not have_content('Google')
  end
  scenario "filter by clicking on show read" do
    visit "/"
    click_on('Show Unread')
    expect(page).to_not have_content('Yahoo')
    expect(page).to have_content('Turing')
    expect(page).to have_content('Google')
  end
  scenario "filter by URL" do
    visit "/"
    fill_in("filter", with: 'www.g')
    expect(page).to_not have_content('Turing')
    expect(page).to_not have_content('Yahoo')
    expect(page).to have_content('Google')
  end
  scenario "filter by Title" do
    visit "/"
    fill_in("filter", with: 'Yahoo')
    expect(page).to_not have_content('Turing')
    expect(page).to_not have_content('Google')
    expect(page).to have_content('Yahoo')
  end
end
# Filter the list of links by a search term as I type into a search box. Filter by both title and url with each key press. This filtering should not be case sensitive.
# Click a "Show Read" button or link to show only links where the read status is true.
# Click a "Show Unread" button or link to show only links where the read status is false.
