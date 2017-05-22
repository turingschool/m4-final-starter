require 'rails_helper'

feature 'user visits link index' do
  before(:each) do

    user = User.create(email: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  end

  scenario 'sees a form to submit a link' do
    visit '/'

    expect(page).to have_field("URL")
    expect(page).to have_field("Title")
    expect(page).to have_field("Read")
  end
end
