require 'rails_helper'

RSpec.feature "Visitor" do
  it "gets redirected to sign in/up if unauthenticated" do

    visit '/'

    expect(page).to have_content("Log In")
    expect(page).to have_content("Sign Up")
  end
end
