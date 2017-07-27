require "rails_helper"

describe "Link form" do
  it "User visits links index page and should see form to input new links" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_selector("input[name='url']")
    expect(page).to have_selector("input[name='title']")
  end

end
