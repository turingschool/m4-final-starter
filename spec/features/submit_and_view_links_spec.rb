require "rails_helper"

RSpec.describe "Logged in user can", :js => :true do
  scenario "submit a new link using a form" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    url = 'https://www.google.com'
    visit '/'
    expect(page).to have_current_path('/')
    fill_in('link[url]', with: url)
    fill_in('link[title]', with: 'test link')
    click_on('Add Link')
    expect(page).to have_content(url)
    expect(page).to have_content('Read?: false')
    expect(page).to have_content('test link')
  end
end
