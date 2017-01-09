require 'rails_helper'

RSpec.describe 'Authentication:' do
  context 'Guest' do
    it 'cannot view index' do
      visit root_path

      expect(current_path).to eq login_path
    end

    it 'can view signup page' do
      visit signup_path

      expect(current_path).to eq signup_path
    end

    it 'cannot view index' do
      visit links_path

      expect(current_path).to eq login_path
    end
  end

  context 'Logged in User' do
    before do
      @me = create :user
      login @me
    end

    it 'can view index' do
      visit links_path

      expect(current_path).to eq links_path
    end
  end
end
