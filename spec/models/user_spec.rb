require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it {should validate_uniqueness_of(:email_address)}
    it {should have_secure_password}
  end
end
