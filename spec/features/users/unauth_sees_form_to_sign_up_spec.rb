require 'rails_helper'

RSpec.feature "Visitor" do
  it "sees form to sign up" do

    visit '/'

    expect(page).to have_link("Sign Up")

    click_link "Sign Up"
    save_and_open_page
    
    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Email address")
    expect(page).to have_content("Password")
    expect(page).to have_content("Password Confirmation")
  end
end
