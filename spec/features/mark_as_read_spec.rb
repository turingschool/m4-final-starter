require "rails_helper"

RSpec.describe "can mark links", js: true do
  let!(:test_user) {
    test_email = 'test@email.com'
    test_password = 'password'
    test_user = User.create(email: test_email, password: test_password)
  }

  before(:each) do
    visit signin_path

    fill_in 'user[email]', with: test_user.email
    fill_in 'user[password]', with: 'password'
    click_on 'Sign In'
  end

  describe 'When clicking on Mark as Read' do
    let!(:link_unread) {
      test_title = 'Test title'
      test_url = 'https://urlockbox-laszlo.herokuapp.com'
      test_user_id = 1
      test_read = false
      test_link = Link.create(title: test_title, url: test_url, user_id: test_user_id, read: test_read)
    }
    scenario "Marks as unread" do
      visit links_path

      expect(page).to have_current_path(links_path)
      expect(Link.count).to eq(1)

      click_on "Mark as Read"

      within('.link-box') do
        expect(page).to have_text("true")
      end
    end
  end

  describe 'When clicking on Mark as Unread' do
    let!(:link_read) {
      test_title = 'Test title'
      test_url = 'https://urlockbox-laszlo.herokuapp.com'
      test_user_id = 1
      test_read = true
      test_link = Link.create(title: test_title, url: test_url, user_id: test_user_id, read: test_read)
    }
    scenario "Marks as unread" do
      visit links_path

      expect(page).to have_current_path(links_path)
      expect(Link.count).to eq(1)

      click_on "Mark as Unread"

      within('.link-box') do
        expect(page).to have_text("false")
      end
    end
  end

end
