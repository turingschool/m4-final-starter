require "rails_helper"

RSpec.describe "User can edit link", :js => :true do
  scenario "When the user clicks on edit button they are able to edit" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    user.links.create(url: 'http://www.google.com', title: 'this')
    visit '/'
    click_on('edit')
    within('.link') do
      fill_in('Title', with: 'change')
      fill_in('URL', with: 'http://www.yahoo.com')
      click_on('save')
    end
    wait_for_ajax
    expect(page).to have_content('change')
    expect(page).to have_content('http://www.yahoo.com')
  end

  scenario "When the user clicks on edit button they are unable to save with bad params" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    user.links.create(url: 'http://www.google.com', title: 'this')
    visit '/'
    click_on('edit')
    within('.link') do
      fill_in('Title', with: 'change')
      fill_in('URL', with: 'not godd')
      click_on('save')
    end
    wait_for_ajax
    expect(page).to have_content('not a valid URL')
  end

end
