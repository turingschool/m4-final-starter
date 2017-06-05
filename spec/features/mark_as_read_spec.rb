require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  attr_reader :user, :link
  before(:each) do
    @user = User.create(email: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password')
    @link = @user.links.create(url: 'http://www.google.com',
                               title: 'Google')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

  end
  scenario "Mark a link as read" do
    visit "/"

    click_button 'Mark as Read'

    within('.link') do
      expect(page).to have_content("Read: false")
    end

  end
end
