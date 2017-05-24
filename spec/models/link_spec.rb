require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it 'can create a link with correct details' do
      test_title = 'Test title'
      test_url = 'https://urlockbox-laszlo.herokuapp.com'
      test_user_id = 1
      test_link = Link.create(title: test_title, url: test_url, user_id: test_user_id)

      expect(test_link).to be_valid
    end

    it 'cannot create a link with invalid URL' do
      test_title = 'Test title'
      test_url = 'invalidURL'
      test_user_id = 1

      test_link = Link.create(title: test_title, url: test_url, user_id: test_user_id)

      expect(test_link).not_to be_valid
    end

    it 'cannot update a link with invalid URL' do
      test_title = 'Test title'
      test_url = 'https://urlockbox-laszlo.herokuapp.com'
      test_invalid_url = 'invalidURL'
      test_user_id = 1

      test_link = Link.create(title: test_title, url: test_url, user_id: test_user_id)
      test_link.url = test_invalid_url
      test_link.save

      test_link = Link.first
      
      expect(test_link.url).to eq(test_url)
      expect(test_link.url).not_to eq(test_invalid_url)
    end

    it 'is created with read status false' do
      test_title = 'Test title'
      test_url = 'https://urlockbox-laszlo.herokuapp.com'
      test_user_id = 1
      test_link = Link.create(title: test_title, url: test_url, user_id: test_user_id)

      expect(test_link.read).to eq(false)
    end

    it 'cannot create a link without URL' do
      test_title = 'Test title'
      test_url = ''
      test_user_id = 1

      test_link = Link.create(title: test_title, url: test_url, user_id: test_user_id)

      expect(test_link).not_to be_valid
    end

    it 'cannot create a link without title' do
      test_title = ''
      test_url = 'https://urlockbox-laszlo.herokuapp.com'
      test_user_id = 1

      test_link = Link.create(title: test_title, url: test_url, user_id: test_user_id)

      expect(test_link).not_to be_valid
    end
  end

  describe 'Methods' do
    let!(:link_unread) {
      test_title = 'Test title'
      test_url = 'https://urlockbox-laszlo.herokuapp.com'
      test_user_id = 1
      test_link = Link.create(title: test_title, url: test_url, user_id: test_user_id)
    }

    let!(:link_read) {
      test_title = 'Test title'
      test_url = 'https://urlockbox-laszlo.herokuapp.com'
      test_user_id = 1
      test_read = true
      test_link = Link.create(title: test_title, url: test_url, user_id: test_user_id, read: test_read)
    }

    it 'returns MARK_READ_TEXT based on READ value' do
      expect(link_unread.mark_read_text).to eq('Mark as Read')
      expect(link_read.mark_read_text).to eq('Mark as Unread')
    end

    it 'returns MARK_READ_CLASS based on READ value' do
      expect(link_unread.mark_read_class).to eq('link-unread')
      expect(link_read.mark_read_class).to eq('link-read')
    end

  end
end