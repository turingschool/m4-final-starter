require "rails_helper"

feature "can create links" do
  before do
    User.create(email: "rsbarbo@example.com", password: "password")
  end

  scenario "Create a new link" do

    visit  root_path

    fill_in :email, with: "rsbarbo@example.com"
    fill_in :password, with: "password"
    click_button "Submit"

    expect(current_path).to eq links_path

    fill_in "URL:", :with => "http://turing.io"
    fill_in "Title:", :with => "Turing"

    click_on "Add Link"

    within('#links-list') do
      expect(page).to have_text("http://turing.io")
      expect(page).to have_text("Turing")
    end
  end
end
