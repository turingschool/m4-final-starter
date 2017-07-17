require "rails_helper"

RSpec.describe "User can edit link", :js => :true do
  scenario "When the user clicks on edit button they are able to edit" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    user.links << create(:link)
    visit '/'
    click_on('edit')
    fill_in('Title', with: 'change')
    fill_in('URL', with: 'http://www.yahoo.com')
    click_on('save')
    expect(page).to have_content('change')
    expect(page).to have_content('http://www.yahoo.com')
  end

end
