require 'rails_helper'

RSpec.describe 'Visitor' do
  it 'is offered a login or sign up page' do
    visit root_path
    expect(page).to have_content('Log in')
    expect(page).to have_content('Sign up')
  end
end
