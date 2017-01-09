require 'rails_helper'

RSpec.describe 'Authentication:' do
  context 'Guest' do
    it 'cannot view index' do
      visit links_path

      expect(current_path).to eq login_path
    end
  end
end
