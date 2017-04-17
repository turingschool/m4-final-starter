require 'rails_helper'

# Each link has an "Edit" button that either takes me to a page to edit the link or allows me to edit the link in place on the page.
# I can edit the title and/or the url of the link.
# I should see flash messages indicating a successful edit, or the reason why my edit was invalid.

describe 'User editing a link', js: true do
  let!(:test_user) {
    test_email = 'test@email.com'
    test_password = 'password'
    test_user = User.create(email: test_email, password: test_password)
  }

  let(:test_link) {
    test_title = 'Test title'
    test_url = 'https://urlockbox-laszlo.herokuapp.com'
    test_user_id = test_user.id
    test_link = Link.create(title: test_title, url: test_url, user_id: test_user_id)
  }

  before(:each) do
    test_link

    visit signin_path

    fill_in 'user[email]', with: test_user.email
    fill_in 'user[password]', with: 'password'
    click_on 'Sign In'
  end

  describe 'Clicking on EDIT button' do
    it 'will populate form with link details' do
      click_on 'Edit'

      expect(find_field('link[title]').value).to eq(Link.first.title)
      expect(find_field('link[url]').value).to eq(Link.first.url)
      expect(find('#link_id', visible: false).value).to eq(Link.first.id.to_s)
    end
  end

  describe 'With correct details' do
    it 'can save it' do
      click_on 'Edit'

      test_updated_title = 'Test title'
      test_updated_url = 'https://updated-urlockbox-laszlo.herokuapp.com'
      fill_in 'link[title]', with: test_updated_title
      fill_in 'link[url]', with: test_updated_url
      click_on 'Save Link'

      expect(page).to have_current_path(links_path)
      expect(Link.count).to eq(1)
      expect(Link.first.title).to eq(test_updated_title)
      expect(Link.first.url).to eq(test_updated_url)
      expect(page).not_to have_content(test_link.url)
      expect(page).to have_content(test_updated_title)
      expect(page).to have_button('Edit')
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