require 'rails_helper'

feature 'edit a link' do
  let(:user) { logged_in_user }
  let(:link) { create(:link) }
  before do
   user.links << link
   visit links_path
  end

  context 'an authenticated user edits a link' do
    scenario 'the user should see a edit button' do
      expect(page).to have_selector(:link_or_button, 'Edit')
    end

    scenario 'the user clicks on edit' do
      click_on 'Edit'
      expect(page).to have_current_path(edit_link_path(link))
    end

    scenario 'the user edits the link' do
      click_on 'Edit'
      fill_in 'link[title]', with: 'New title'
      fill_in 'link[url]', with: 'https://www.this-is-edited.com'
      click_on 'Submit'

      expect(page).to have_content('You successfully updated your link.')
      expect(page).to have_current_path(links_path)
    end
  end
end
