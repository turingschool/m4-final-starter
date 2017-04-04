require 'rails_helper'

describe 'Links API endpoints' do
  describe 'Add a new link - POST link' do
    it 'can add a link into the database when all details are correct' do
      test_title = 'Test Link'
      test_url = 'https://urlockbox-laszlo.herokuapp.com'
      params = {
        title: test_title,
        url: test_url
      }
      post '/api/v1/links', params

      expect(response.code).to eq('204')
      expect(Link.count).to eq(1)
      expect(Link.first.title).to eq(test_title)
      expect(Link.first.url).to eq(test_url)
    end
  end
end