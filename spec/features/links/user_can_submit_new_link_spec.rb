require 'rails_helper'

describe "when a user is logged in and on links#index", :js => :true do
  context "and they fill in the new link form" do
    xit "they are able to submit a new link" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit links_path
      expect(page).to_not have_content("Sign In")

      fill_in "link[url]", with: "https://www.bbc.co.uk/"
      fill_in "link[title]", with: "BBC"
      click_on "Add Link"

      expect(page).to have_content("BBC")
    end
  end
end

xdescribe "when a user is logged in and on links#index", :js => :true do
  context "and they fail at correctly submitting a new link" do
    it "they are unable to submit a new link without filling in fields" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit links_path
      expect(page).to_not have_content("Sign In")

      click_on "Add Link"

      expect(page).to have_content("Title can't be blank. Url can't be blank. Url is not a valid URL")
    end
    xit "they are unable to submit a new link with an invalid URL" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit links_path
      expect(page).to_not have_content("Sign In")

      fill_in "link[url]", with: "BBC"
      fill_in "link[title]", with: "BBC"
      click_on "Add Link"

      expect(page).to have_content("Url is not a valid URL")
    end
    xit "they are unable to submit a new link without filling out a URL" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit links_path

      fill_in "link[title]", with: "BBC"
      click_on "Add Link"

      expect(page).to have_content("Url can't be blank. Url is not a valid URL")
    end
    xit "they are unable to submit a new link without filling in a title" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit links_path
      expect(page).to_not have_content("Sign In")

      fill_in "link[url]", with: "https://www.bbc.co.uk/"
      click_on "Add Link"

      expect(page).to have_content("Title can't be blank.")
    end
  end
end
