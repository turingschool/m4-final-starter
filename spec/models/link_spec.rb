require 'rails_helper'

RSpec.describe Link, type: :model do
  it "is valid with valid attributes" do
    expect(Link.new(url: 'http://www.yahoo.com', title: 'test')).to be_valid
  end
  it "is not valid without a bad url" do
    expect(Link.new(url: 'yahoo', title: 'test')).to_not be_valid
  end
  it "is not valid without a title" do
    expect(Link.new(url: 'http://www.yahoo.com', title: '')).to_not be_valid
  end
  
end
