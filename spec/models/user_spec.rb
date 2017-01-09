require 'rails_helper'

RSpec.describe User, type: :model do
   user = User.new(email: "rsbarbo@example.com", password: "password")

   # validates the presence of email and password
   it { should validate_presence_of :email }
   it { should validate_presence_of :password }

   # => confirm that attributes are valid
   it "expect user to be valid" do
      expect(user).to be_valid
   end

   it "expect user to not be valid" do
      user.email = "rsbarboexample.com"
      expect(user).to_not be_valid
   end
end
