require 'rails_helper'

#Section4
# As an authenticated user, I can do the following in the Links index without reloading the page:
# Creating links
# Create a new link, and see it in added to the top of the list.
# Ensure that flash messages continue to appear.

describe 'User adding a new link', js: true do
  let!(:test_user) {
    test_email = 'test@email.com'
    test_password = 'password'
    test_user = User.create(email: test_email, password: test_password)
  }

  let!(:test_link) {
    test_title = 'Test title'
    test_url = 'https://urlockbox-laszlo.herokuapp.com'
    test_user_id = test_user.id
    test_read = true
    test_link = Link.create(title: test_title, url: test_url, user_id: test_user_id, read: test_read)
  }

  before(:each) do
    visit signin_path

    fill_in 'user[email]', with: test_user.email
    fill_in 'user[password]', with: 'password'
    click_on 'Sign In'
  end

  describe 'With correct details' do
    it 'to the top of the link index list' do
      test_last_title = 'Last title'
      test_last_url = 'https://last.com'
      fill_in 'link[title]', with: test_last_title
      fill_in 'link[url]', with: test_last_url
      click_on 'Save Link'

      expect(page).to have_current_path(links_path)
      expect(page.assert_selector('div.link-box', :count => 2)).to be_truthy
      within('.link-box:nth-of-type(1)') do
        expect(page).to have_content(test_last_title)
        expect(page).to have_content(test_last_url)
      end
      within('.link-box:nth-of-type(2)') do
        expect(page).to have_content(test_link.title)
        expect(page).to have_content(test_link.url)
      end
    end
  end

  # describe 'With incorrect details' do
  #   it 'will show an error message' do
  #     test_title = 'Test title'
  #     test_url = 'invalidURL'
  #     fill_in 'link[title]', with: test_title
  #     fill_in 'link[url]', with: test_url
  #     click_on 'Save Link'

  #     expect(page).to have_current_path(links_path)
  #     expect(Link.count).to eq(0)
  #     expect(page).to have_content('Url Invalid')
  #   end

  #   it 'will save after correction' do
  #     test_title = 'Test title'
  #     test_invalid_url = 'invalidURL'
  #     test_valid_url = 'https://urlockbox-laszlo.herokuapp.com'
  #     fill_in 'link[title]', with: test_title
  #     fill_in 'link[url]', with: test_invalid_url
  #     click_on 'Save Link'

  #     fill_in 'link[title]', with: test_title
  #     fill_in 'link[url]', with: test_valid_url
  #     click_on 'Save Link'

  #     expect(page).to have_current_path(links_path)
  #     expect(page).to have_current_path(links_path)
  #     expect(page).to have_content(test_title)
  #     expect(page).to have_content(test_valid_url)
  #     expect(Link.first.url).to eq(test_valid_url)
  #     expect(Link.first.title).to eq(test_title)
  #   end
  # end

end