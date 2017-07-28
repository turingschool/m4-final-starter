require "rails_helper"

RSpec.describe "user" do
  it "is invalid without email" do
    user = User.create(password: "hi")
    expect(user).to be_invalid
  end

  it "is invalid without password" do
    user = User.create(email: "j@j.com")
    expect(user).to be_invalid
  end

  it "is valid with email and password" do
    user = User.create(email: "j@j.com", password: "password")
    expect(user).to be_valid
  end

  it "is validates unique email" do
    user1 = User.create(email: "j@j.com", password: "password")
    user2 = User.create(email: "j@j.com", password: "password")
    expect(user1).to be_valid
    expect(user2).to be_invalid
    expect(User.count).to eq(1)
  end

end
