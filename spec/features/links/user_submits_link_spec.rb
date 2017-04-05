require 'rails_helper'

feature 'User submits a link' do
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

    scenario 'the user fills in the fields' do
      fill_in :url , with: 'https://www.pinkbike.com'
      fill_in :title, with: 'PinkBike'
      save_and_open_page
      click_on 'Add Link'
      expect(page).to have_content('PinkBike')
    end
  end
end
