require 'rails_helper'

feature 'user views index and decides to edit link' do
  attr_reader :user, :link
  before(:each) do
    @user = User.create(email: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password')
    @link = @user.links.create(url: 'http://www.google.com',
                               title: 'Google')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

  end

  scenario 'user clicks edit link and is taken to edit page for that link' do
    visit '/'

    click_button 'Edit Google'

    expect(current_path).to eq(edit_link_path(link))
  end
  scenario 'user clicks edits form and submits it to edit the link' do
    visit '/'

    click_button 'Edit Google'

    fill_in 'link_url', with: 'http://www.yahoo.com'
    fill_in 'link_title', with: 'Yahoo!'
    click_button 'Edit Link'

    expect(current_path).to eq('/links')
    
    expect(page).to have_selector('.link', count: 1)

    within all('.link').first do
      expect(page).to have_link('http://www.yahoo.com', href: 'http://www.yahoo.com')
      expect(page).to have_content('Yahoo')
    end
  end
end
