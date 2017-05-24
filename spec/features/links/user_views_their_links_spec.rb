require 'rails_helper'

feature 'user views their links' do
  let(:user) { logged_in_user }
  let(:links) { create_list(:link, 5) }
  let!(:other_links) { create_list(:link, 5) }
  before do
   user.links << links
   visit links_path
  end

  context 'An authenticated user' do
    scenario 'should see only there links' do
      user.links.each do |link|
        expect(link.user_id).to eql(user.id)
        expect(page).to have_content(link.title)
        expect(page).to have_content(link.url)
      end

      expect(user.links.count).to eq(5)
      expect(Link.count).to eq(10)
    end
  end
end
