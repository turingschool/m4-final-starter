require 'rails_helper'

describe "When a guest visits the root path" do
  scenario "they can click login and are redirected to the login page" do
    visit root_path

    click_on "Login"

    expect(current_path).to eq login_path
  end

  scenario "the can click create account and are redirected to the create account page" do
    visit root_path

    click_on "Create Account"

    expect(current_path).to eq new_user_path
  end
end