require 'rails_helper'

RSpec.feature "Visitor" do
  it "can create an account" do
    visit '/'
    click_link "Sign Up"

    fill_in "Email address", with: "Edilene"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create account"

    expect(current_path).to eq(links_path)
  end
end
