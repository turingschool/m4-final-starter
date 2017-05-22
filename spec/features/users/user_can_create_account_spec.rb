require 'rails_helper'

describe "when a user visits the root page, and they click on sign up" do
  scenario "they are taken to a form where they can create an account" do
    visit root_path
    click_on "Sign Up"
    expect(current_path).to eq(new_user_path)

    

  end
end
