require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without an email' do
        user = User.new(password: 'password')

        expect(user).to be_invalid
      end
    end
  end
end
