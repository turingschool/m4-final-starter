require 'rails_helper'

describe 'user signs out' do
  context 'as a signed in user' do
    let!(:user) { create(:user) }

    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit links_path
    end

    describe 'when on links#index' do
      it 'I should not see a sign in link' do
        expect(page).to_not have_link 'Login'
        expect(current_path).to eq links_path
      end

      it 'I should see a sign out link' do
        expect(page).to have_content 'Sign Out'
        expect(current_path).to eq links_path
      end
    end
  end
end
