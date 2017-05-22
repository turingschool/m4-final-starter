require 'rails_helper'

describe 'user edits link' do
  context 'as a signed in user' do
    let!(:user) { create(:user) }
    let!(:links) { create_list(:link, 2, user: user) }

    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit links_path
    end

    describe 'on links#index' do
      it 'I should be able to edit each link' do
        expect(page).to have_selector("input[value=Edit]", count: user.links.count)
      end
    end

    describe 'when I click Edit' do
      it 'I should be redirected to the edit page' do
        within "article#link#{user.links.first.id}" do
          click_on "Edit"
          expect(current_path).to eq edit_link_path(user.links.first)
        end
      end

      describe 'when I change information on the form' do
        it 'I should be redirected to links#index' do
          within "article#link#{user.links.first.id}" do
            click_on 'Edit'
          end

          fill_in 'link_title', with: "Fresh Banner"
          fill_in 'link_url', with: "https://google.com"

          click_on 'Update Link'

          expect(page).to have_content 'Link Updated!'
        end
      end
    end
  end
end
