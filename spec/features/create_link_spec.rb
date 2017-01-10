require "rails_helper"

RSpec.describe Link, :js => :true do
  scenario 'indeas show all links for current user' do
    me = create :user
    link1 = create :link, title: 'Link 1', url: 'http://www.example.com/1', user: me
    link2 = create :link, title: 'Link 2', url: 'http://www.example.com/2', user: me
    login me
    visit links_path

    within('#links-list') do
      expect(page).to have_text("Link 1")
      expect(page).to have_text("http://www.example.com/1")
      expect(page).to have_text("Link 2")
      expect(page).to have_text("http://www.example.com/2")
    end
  end

  scenario "can be created" do
    me = create :user
    login me
    visit "/"

    fill_in "Title:", :with => "Turing"
    fill_in "URL:", :with => "http://turing.io"
    click_on "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
    end

  end

  scenario 'can be marked read' do
    pending "JQury is hard"
    me = create :user
    login me
    link = create :link, user: me
    visit '/'

    expect(page).to have_css('.mark-read')
    click_on 'Mark as Read'
    expect(page).to have_css('.mark-unread')

  end
end
