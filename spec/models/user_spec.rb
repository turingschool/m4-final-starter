require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without an email' do
        user = User.new(password: 'password', password_confirmation: 'password')

        expect(user).to be_invalid
      end

      it 'has a unique email' do
        user = User.create(email_address: 'd@d.com', password: 'password', password_confirmation: 'password')
        user_2 = User.new(email_address: 'd@d.com', password: 'password', password_confirmation: 'password')

        expect(user_2).to be_invalid
      end

      it 'is invalid without a password' do
        user = User.new(email_address: 'd@d.com', password_confirmation: 'password')

        expect(user).to be_invalid
      end

      it 'is invalid without a password confirmation' do
        user = User.new(email_address: 'd@d.com', password: 'password')

        expect(user).to be_invalid
      end
    end
  end
end
