require 'rails_helper'

RSpec.feature 'Authenticated user views their links' do
  it 'they only see their own links' do
    user = create(:user)
    link_1 = create(:link, user: user)
    link_2 = create(:link, title: 'Unique Title', url: 'http://someurl.com')

    page.set_rack_session(user_id: user.id)

    visit links_path

    expect(page).to have_content(link_1.title)
    expect(page).to have_content(link_1.url)
    expect(page).to_not have_content(link_2.title)
    expect(page).to_not have_content(link_2.url)
  end
end
