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

      it 'is invalid if password confirmation does not match' do
        user = User.new(email_address: 'd@d.com', password: 'password', password_confirmation: 'notpassword')

        expect(user).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with all attributes' do
        user = User.new(email_address: 'd@d.com', password: 'password', password_confirmation: 'password')

        expect(user).to be_valid
      end
    end
  end

  describe 'associations' do
    it 'has many links' do
      user = create(:user)

      expect(user).to respond_to(:links)
    end
  end
end
