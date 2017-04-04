require 'rails_helper'

RSpec.feature 'Authenticated user creates a new link' do
  it 'they can create a link' do
    user = create(:user)

    page.set_rack_session(user_id: user.id)

    visit links_path
    
    within('form') do
      fill_in 'link[title]', with: 'Some Title'
      fill_in 'link[url]', with: 'http://someurl.com'
      click_on 'Create Link'
    end

    expect(current_path).to eq(links_path)
    expect(page).to have_content('Some Title')
    expect(page).to have_content('http://someurl.com')
  end
end
