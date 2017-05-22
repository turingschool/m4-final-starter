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

    expect(page).to have_css("input#link_url")
    expect(page).to have_css("input#link_title")
    expect(page).to have_css("input#link_read_checkedtrue_uncheckedfalse")
  end
end
