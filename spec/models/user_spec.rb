require 'rails_helper'

describe User, type: :model do
  context "validations" do
    it {is_expected.to validate_uniqueness_of(:email)}

    it {is_expected.to validate_presence_of(:email)}
    it {is_expected.to validate_presence_of(:password)}
  end

  context "relationships" do
    it {should have_many(:links)}
  end
end
