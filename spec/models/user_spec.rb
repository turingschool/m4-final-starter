require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    expect(User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password')).to be_valid
  end
  it "is not valid without a email" do
    expect(User.new(password: 'password', password_confirmation: 'password')).to_not be_valid
  end
  it "is not valid without a password" do
    expect(User.new(email: 'test@test.com', password_confirmation: 'password')).to_not be_valid
  end
  it "is not valid without a matching password confirmation" do
    expect(User.new(email: 'test@test.com', password: 'password', password_confirmation: 'pass')).to_not be_valid
  end
end
