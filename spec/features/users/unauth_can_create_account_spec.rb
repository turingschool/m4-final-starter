require 'rails_helper'

RSpec.feature "Visitor" do
  it "can create an account and it's redirected to Links Index" do
    visit '/'
    click_link "Sign Up"

    fill_in "Email address", with: "me@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create account"

    expect(current_path).to eq(links_path)
  end
end
