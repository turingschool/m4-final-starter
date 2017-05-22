RSpec.describe User, type: :model do
  context "secure password" do
    it { should have_secure_password }
  end

  context "validations" do
    it { should validate_uniqueness_of :email_address }
    it { should validate_presence_of :email_address }
    it { should validate_presence_of :password }
  end


  context "validations" do
    it "user with all attributes is valid" do
      user = create(:user)
      expect(user).to be_valid
    end

    it "should not be valid without an email address " do
      user = User.new(email_address: "",
                      password: "password")
      expect(user).to_not be_valid
    end

    it "should not be valid without a password" do
      user = User.new(email_address: "me@email.com",
                      password: "")
      expect(user).to_not be_valid
    end
  end
end
