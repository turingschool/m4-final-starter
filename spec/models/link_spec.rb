require 'rails_helper'

describe Link, type: :model do
  context "validations" do
    it {is_expected.to validate_presence_of(:title)}
    it {is_expected.to validate_presence_of(:url)}
  end

  context "relationships" do
    it {should belong_to(:user)}
  end

  context "methods" do
    it '#save_link saves a new link' do
      user = create(:user)
      params = {"title": "title", "url": "http://www.google.com"}
      link = Link.new
      expect(Link.all.count).to eq(0)

      link.save_link(params, user)
      last = Link.last

      expect(Link.all.count).to eq(1)
      expect(last.user).to eq(user)
      expect(last.title).to eq("title")
      expect(last.url).to eq("http://www.google.com")
    end
  end
end
