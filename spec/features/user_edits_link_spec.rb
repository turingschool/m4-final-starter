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

    click_link 'Edit Google'

    expect(current_path).to eq(edit_link_path(link))
  end
end
