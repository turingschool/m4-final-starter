require 'rails_helper'

describe "when a user is logged in and on links#index" do
  context "and they fill in the new link form" do
    it "they are able to submit a new link" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit links_path
      expect(page).to_not have_content("Sign In")

      fill_in "link[url]", with: "https://www.bbc.co.uk/"
      fill_in "link[title]", with: "BBC"
      click_on "Add Link"

      expect(current_path).to eq(links_path)
      expect(page).to have_content("BBC")
    end
  end
end
