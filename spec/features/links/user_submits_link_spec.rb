require 'rails_helper'

xfeature 'User submits a link' do
  context 'the user attempts to submit a link' do

    before do
      logged_in_user
      visit links_path
    end

    scenario 'the user should see a url field' do
      expect(page).to have_field(:url)
    end

    scenario 'the user should see a title field' do
      expect(page).to have_field(:title)
    end
  end
end
