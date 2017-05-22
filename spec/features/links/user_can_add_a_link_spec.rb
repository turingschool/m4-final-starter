require 'rails_helper'

RSpec.feature "Links" do
  it "registered user sees form to add a link" do
    user = create(:user, email_address: "me@email.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    expect(page).to have_content("Url")
    expect(page).to have_content("Title")
  end
end
