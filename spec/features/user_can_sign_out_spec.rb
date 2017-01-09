require "rails_helper"

feature "User can sign out" do
  before do
    User.create(email: "rsbarbo@example.com", password: "password")
  end

  scenario "user can see logout button when logged in" do

    visit  root_path
    expect(page).not_to have_content("Logout")


    fill_in :email, with: "rsbarbo@example.com"
    fill_in :password, with: "password"
    click_button "Submit"

    expect(current_path).to eq links_path
    expect(page).to have_content("Logout")
  end


  scenario "user can logout" do

    visit  root_path
    expect(page).not_to have_content("Logout")


    fill_in :email, with: "rsbarbo@example.com"
    fill_in :password, with: "password"
    click_button "Submit"

    expect(page).to have_content("Logout")

    click_link "Logout"

    expect(current_path).to eq login_path
  end


end
