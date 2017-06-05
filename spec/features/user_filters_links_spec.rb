require "rails_helper"

RSpec.describe "can filter links", :js => :true do
  attr_reader :user, :link
  before(:each) do
    @user = User.create(email: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password')
    @user.links.create(url: 'http://www.google.com',
                       title: 'Google')
    @user.links.create(url:     'http://www.yahoo.com',
                       title:   'Yahoo!',
                       read:    true)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

  end
  scenario "links not matching query are hidden" do
    visit "/"

    page.find('input[name=filter-input]').set('goo')
    link_id = user.links.last.id

    expect(page).to have_no_content('Yahoo!')
    expect(page).to have_no_content('http://www.yahoo.com')
    expect(page).to have_no_content('true')

    within all('.link').first do
      expect(page).to have_content('Google')
      expect(page).to have_content('http://www.google.com')
      expect(page).to have_content('false')
    end
  end
end
