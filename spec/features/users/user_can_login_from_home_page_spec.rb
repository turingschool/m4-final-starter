require 'rails_helper'

describe "When a guest visits the root path" do
  scenario "they can click login" do

    visit root_path

    click_on "Login"

    expect(current_path).to eq login_path
  end
end