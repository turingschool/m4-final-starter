require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it "link belongs to a user" do
      user = create(:user)
      link = create(:link, user_id: user)

      expect(link).to respond_to(:user)
    end
  end

  describe 'validations' do
    it "is valid with valid attributes" do
      user = create(:user)
      link = create(:link, user_id: user)
      expect(link.title).to eq('google')
      expect(link.url).to eq('https://www.google.com/')
      expect(link.read).to eq(false)
      expect(link).to be_valid
    end

    it "is invalid without a title" do
      user = create(:user)
      link = user.links.create(url: 'https://www.google.com/')

      expect(link).to_not be_valid
    end

    it "is invalid without a url" do
      user = create(:user)
      link = user.links.create(title: 'google')

      expect(link).to_not be_valid
    end
    it "is invalid with an invalid url" do
      user = create(:user)
      link = user.links.create(url: 'google.com', title: 'google')

      expect(link).to_not be_valid
    end
  end
end
