require 'rails_helper'

RSpec.feature 'Authenticated user views their links' do
  it 'they only see their own links' do
    user = create(:user)
    link_1, link_2 = create_list(:link, 2, user: user)
    link_3 = create(:link)

    page.set_rack_session(user_id: user.id)

    visit links_path

    expect(page).to have_content(link_1.title)
    expect(page).to have_content(link_1.url)
    expect(page).to have_content(link_2.title)
    expect(page).to have_content(link_2.url)
    expect(page).to_not have_content(link_3.title)
    expect(page).to_not have_content(link_3.url)
  end
end
