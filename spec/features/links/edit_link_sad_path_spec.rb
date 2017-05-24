require 'rails_helper'

feature 'edit link sad path' do
  let(:user) { logged_in_user }
  let(:link) { create(:link) }
  before do
   user.links << link
   visit links_path
  end

  context 'an authenticated user edits a link' do
    scenario 'the user leaves the title field blank' do
      click_on 'Edit'
      fill_in 'link[title]', with: ''
      fill_in 'link[url]', with: 'https://www.this-is-edited.com'
      click_on 'Submit'

      expect(page).to have_content("Title can't be blank")
      expect(page).to have_current_path(link_path(link))
    end

    scenario 'the user leaves the url field blank' do
      click_on 'Edit'
      fill_in 'link[title]', with: 'New Title'
      fill_in 'link[url]', with: ''
      click_on 'Submit'

      expect(page).to have_content("Url can't be blank")
      expect(page).to have_content("Url is not a valid URL")
      expect(page).to have_current_path(link_path(link))
    end

    scenario 'the user enters a invalid url' do
      click_on 'Edit'
      fill_in 'link[title]', with: 'New Title'
      fill_in 'link[url]', with: 'www.aaa.com'
      click_on 'Submit'

      expect(page).to have_content("Url is not a valid URL")
      expect(page).to have_current_path(link_path(link))
    end
  end
end
