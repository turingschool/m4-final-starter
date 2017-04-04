require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it 'has a valid model' do
      test_user = User.new

      expect(test_user).to be_valid
    end
  end
end
