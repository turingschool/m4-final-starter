require 'rails_helper'

feature 'edit a link' do
  let(:user) { logged_in_user }
  before do
   user.links << create(:link)
   visit links_path
  end

  context 'an authenticated user edits a link' do
    scenario 'the user should see a edit button' do
      expect(page).to have_selector(:link_or_button, 'Edit')
    end
  end
end
