require 'rails_helper'

RSpec.describe Link, type: :model do
   link = Link.new(url: "http://turing.io", title: "Turing")

   # validates the presence of email and password
   it { should validate_presence_of :url }
   it { should validate_presence_of :title }

   # => confirm that attributes are valid
   it "expect link to be valid" do
      expect(link).to be_valid
   end

   it "expect link to not be valid" do
      link.title = ""
      expect(link).to_not be_valid
   end
end
