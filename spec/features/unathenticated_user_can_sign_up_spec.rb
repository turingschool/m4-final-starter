require 'rails_helper'

RSpec.feature "Unathenticated User Can Sign Up", type: :feature do
  it "shows sign up form" do
    visit root_path

    expect(page).to have_content("Log in")

    click_on "Sign up"

    expect(page).to have_field("user_email")
    expect(page).to have_field("user_password")
    expect(page).to have_field("user_password_confirmation")
  end

  it "allows new user to create an account" do
    user = { email: "turing@example.com", password: "password" }
    sign_up_user(user)
    # save_and_open_page
    expect(current_path).to eq(links_path)
  end

  xit "doesn't allow emails to be taken more than once" do
    user = create(:user)
    sign_up_user(user)
    visit destroy_user_session_path
    # sign_up_user

    expect(page).to have_content("Email has already been taken")
  end
end
