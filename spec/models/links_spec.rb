RSpec.describe Link, type: :model do
  context "validations" do
      it { should validate_presence_of :url }
      it { should validate_presence_of :title }
      it { should belong_to :user }
    end


  context "validations" do
    it "link with all attributes is valid" do
      link = create(:link)
      expect(link).to be_valid
    end
  end
end
