require 'rails_helper'

describe Link do
  describe 'validations'do
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:title) }
    it { should validate_inclusion_of(:read).in_array([true, false]) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
