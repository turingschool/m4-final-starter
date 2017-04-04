require 'rails_helper'

RSpec.feature 'Authenticated user edits a link' do
  before(:each) do
    user = create(:user)
    @link = create(:link, title: 'Old Title', url: 'http://oldurl.com', user: user)
    page.set_rack_session(user_id: user.id)
    visit links_path
  end

  context 'succesful edit' do
    it 'they can edit a link' do
      within('table') do
        click_on 'Edit'
      end

      expect(current_path).to eq(edit_link_path(@link))
      
      within('form') do
        fill_in 'link[title]', with: 'New Title'
        fill_in 'link[url]', with: 'http://newurl.com'
        click_on 'Update Link'
      end

      expect(current_path).to eq(links_path)
      expect(page).to have_content('New Title')
      expect(page).to have_content('http://newurl.com')
      expect(page).to_not have_content('Old Title')
      expect(page).to_not have_content('http://oldurl.com')
    end
  end
end
