require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it 'can create a link with correct details' do
      test_title = 'Test title'
      test_url = 'https://urlockbox-laszlo.herokuapp.com'
      test_link = Link.create(title: test_title, url: test_url)

      expect(test_link).to be_valid
    end
  end
end