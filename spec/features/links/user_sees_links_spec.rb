require 'rails_helper'

describe 'user sees links' do
  context 'as a signed in user' do
    let!(:user) { create(:user) }
    let!(:links) { create_list(:link, 2, user: user) }

    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit links_path
    end

    describe 'on links#index' do
      it 'I should see my links' do
        expect(Link.count).to eq 2
      end
    end
  end
end
