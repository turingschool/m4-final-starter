require "rails_helper"

describe "User log out" do
  it "User visits links index page and logs out" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_on 'Log Out'

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Login')
  end
end
