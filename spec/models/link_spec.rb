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

    xit 'cannot create a link with invalid URL' do
      test_title = 'Test title'
      test_url = 'invalidURL'
      test_user_id = 1

      
      test_link = Link.create(title: test_title, url: test_url, user_id: test_user_id)

      expect(test_link).not_to be_valid
    end


  end
end