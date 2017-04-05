require 'rails_helper'

describe 'Links API endpoints' do
  let!(:test_user) {User.create(email: 'test@email.com', password: 'password')}

  describe 'Add a new link - POST link' do
    it 'can add a link into the database when all details are correct' do
      test_title = 'Test Link'
      test_url = 'https://urlockbox-laszlo.herokuapp.com'
      params = {
        title: test_title,
        url: test_url,
        user_id: test_user.id
      }
      post '/api/v1/links', params

      expect(response.code).to eq('204')
      expect(Link.count).to eq(1)
      expect(Link.first.title).to eq(test_title)
      expect(Link.first.url).to eq(test_url)
    end

    it 'cannot add an invalid link into the database' do
      test_title = 'Test Link'
      test_url = 'urlockbox-laszlo.herokuapp.com'
      params = {
        title: test_title,
        url: test_url,
        user_id: test_user.id
      }

      post '/api/v1/links', params

      expect(response.body).to include('URL is not valid')
      expect(response.code).to eq('400')
      expect(Link.count).to eq(0)
    end
  end

  describe 'Request list of all links for current user' do
    it "returns a JSON with the user's links" do
      test_title = 'Test title'
      test_url = 'https://urlockbox-laszlo.herokuapp.com'
      test_user_id = test_user.id
      test_link = Link.create(title: test_title, url: test_url, user_id: test_user_id)

      params = {
        user_id: test_user.id
      }

      get '/api/v1/links', params

      expect(response.body).to include(test_title)
      expect(response.body).to include(test_url)
      expect(response.code).to eq('200')
    end
  end

end