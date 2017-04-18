require 'rails_helper'

describe 'Filtering links', js: true do
  let!(:test_user) {
    test_email = 'test@email.com'
    test_password = 'password'
    test_user = User.create(email: test_email, password: test_password)
  }

  let!(:test_link1) {
    test_title = 'Test title'
    test_url = 'https://urlockbox-laszlo.herokuapp.com'
    test_user_id = test_user.id
    test_read = false
    test_link1 = Link.create(title: test_title, url: test_url, user_id: test_user_id, read: test_read)
  }

  let!(:test_link2) {
    test_title = 'Other one'
    test_url = 'https://anotherapp.com'
    test_user_id = test_user.id
    test_read = true
    test_link2 = Link.create(title: test_title, url: test_url, user_id: test_user_id, read: test_read)
  }

  before(:each) do
    visit signin_path

    fill_in 'user[email]', with: test_user.email
    fill_in 'user[password]', with: 'password'
    click_on 'Sign In'
  end

  describe 'typing title' do
    it 'shows relevant link only' do
      visit links_path

      fill_in 'filter-text', with: 'title'

      expect(page).to have_content(test_link1.title)
      expect(page).not_to have_content(test_link2.title)
    end
  end

  describe 'typing url' do
    it 'shows relevant link only' do
      visit links_path

      fill_in 'filter-text', with: 'nothe'

      expect(page).to have_content(test_link2.title)
      expect(page).not_to have_content(test_link1.title)
    end
  end

end