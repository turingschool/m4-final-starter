require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        link = Link.new(url: 'http://someurl.com')

        expect(link).to be_invalid
      end

      it 'is invalid without a url' do
        link = Link.new(title: 'Some Title')

        expect(link).to be_invalid
      end

      it 'url must be valid url' do
        link = Link.new(title: 'Some Title', url: 'noturl')

        expect(link).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with all attributes' do
        link = Link.new(title: 'Some Title', url: 'http://http://someurl.com')

        expect(link).to be_valid
      end

      it 'is not read by default' do
        link = Link.new(title: 'Some Title', url: 'http://someurl.com')

        refute link.read
      end
    end
  end

  describe 'associations' do
    it 'belongs_to a user' do
      link = create(:link)

      expect(link).to respond_to(:user)
    end
  end
end
