require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it 'has a valid model' do
      test_user = User.create(email: "test@email.com", password: 'password')

      expect(test_user).to be_valid
    end
    it 'must have an email entered' do
      test_password = 'password'
      test_user = User.create(password: test_password)

      expect(test_user).not_to be_valid
    end
    it 'cannot have two user with the same email' do
      test_email = 'test@email.com'
      test_password = 'password'
      test_user1 = User.create(email: test_email, password: test_password)
      test_user2 = User.create(email: test_email, password: test_password)

      expect(test_user1).to be_valid
      expect(test_user2).not_to be_valid
      expect(User.count).to eq(1)
    end
  end
end
