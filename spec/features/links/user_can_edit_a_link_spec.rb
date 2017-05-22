require 'rails_helper'

describe "when a user is on links#index" do
  context "and they select 'edit' for a link" do
    it "redirects them to a form to edit the link's title and url" do
      user = create(:user)
      link = create(:link, user: user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit links_path
      click_on "Edit"
      expect(current_path).to eq(edit_link_path(link))
    end
  end
end
