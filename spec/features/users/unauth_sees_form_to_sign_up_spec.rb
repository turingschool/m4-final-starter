require 'rails_helper'

RSpec.feature "Visitor" do
  it "sees form to sign up" do

    visit '/'

    expect(page).to have_link("Sign Up")

    click_link "Sign Up"

    expect(page).to have_content("Email address")
    expect(page).to have_content("Password")
    expect(page).to have_content("Password Confirmation")
  end
end
