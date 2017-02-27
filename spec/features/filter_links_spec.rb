require "rails_helper"

RSpec.describe Link, :js => :true do
  it 'can be filter to show read' do
    me = create :user
    link1 = create :link, title: 'Read Link', url:  'http://www.example.com/1', read: true, user: me
    link2 = create :link, title: 'Unread Link', url:  'http://www.example.com/2', read: false, user: me
    login me
    visit links_path

    within('#filters') { click_on 'Read' }

    within('#links-list') do
      expect(page).to have_text('Read Link')
      expect(page).not_to have_text('Unread Link')
    end
  end
  it 'can be filter to show unread' do
    me = create :user
    link1 = create :link, title: 'Read Link', url: 'http://www.example.com/1', read: true, user: me
    link2 = create :link, title: 'Unread Link', url: 'http://www.example.com/2', read: false, user: me
    login me
    visit links_path

    within('#filters') { click_on 'Unread' }

    within('#links-list') do
      expect(page).not_to have_text('Read Link')
      expect(page).to have_text('Unread Link')
    end
  end
  it 'can be filtered to match search' do
    pending 'fill_in doesnt change value?'
    me = create :user
    link1 = create :link, title: 'Read Link', url: 'http://www.example.com/1', user: me
    link2 = create :link, title: 'Unread Link', url: 'http://www.example.com/2', user: me
    login me
    visit links_path

    fill_in 'search_text', with: 'Un'
    click_on 'Search'

    within('#links-list') do
      expect(page).not_to have_text('Read Link')
      expect(page).to have_text('Unread Link')
    end
  end
end
