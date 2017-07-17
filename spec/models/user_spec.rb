require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = create(:user)

    expect(user.email).to eq("bschwartz@gmail.com")
    expect(user.password).to eq('123')
    expect(user.password_digest).to be_truthy
    expect(user.password_confirmation).to be_truthy
    expect(user).to be_valid
  end
  it "is invalid without an email" do
    user = User.create(password: '123', password_confirmation: '123')

    expect(user).to_not be_valid
  end
  it "is invalid without a password" do
    user = User.create(email: 'bschwartz@gmail.com', password_confirmation: '123')

    expect(user).to_not be_valid
  end
  it "is invalid without a password confirmation" do
    user = User.create(email: 'bschwartz@gmail.com', password: '123')

    expect(user).to_not be_valid
  end
  it "is invalid if email is already taken" do
    user1 = create(:user)
    user2 = User.create(email: 'bschwartz@gmail.com', password: '123', password_confirmation: '123')

    expect(user1).to be_valid
    expect(user2).to_not be_valid
  end
end
