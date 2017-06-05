require 'rails_helper'

feature 'user visits link index', js: true do
  before(:each) do
    @user = User.create(email: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

  end

  scenario 'sees a form to submit a link' do

    visit '/'

    expect(page).to have_css("input[name=url]")
    expect(page).to have_css("input[name=title]")
  end

  scenario 'can create a link that is then associated with that user' do

    visit '/'

    page.find('input[name=url]').set('http://www.google.com')
    page.find('input[name=title]').set('Google')

    expect {click_button "Add Link"}.to change {Link.count}.by(1)

    expect(@user.links.count).to eq(1)
  end
  xscenario 'cannot create a link with an invalid url' do

    visit '/'

    page.find('input#link_url').set('htp:/ww.yaho.com')
    page.find('input#link_title').set('Google')
    expect {click_button "Add Link"}.to change {Link.count}.by(0)

  end
  scenario 'cannot create a link without a title' do

    visit '/'

    page.find('input#link_url').set('http://www.yahoo.com')
    page.find('input#link_title').set('')

    expect {click_button "Add Link"}.to change {Link.count}.by(0)

  end
end
