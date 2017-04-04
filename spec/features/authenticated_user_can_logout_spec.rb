require 'rails_helper'

RSpec.feature 'Authenticated user logs out' do
  let(:user) { create(:user) }

  it 'they can logout' do
    page.set_rack_session(user_id: user.id)

    visit links_path

    expect(page).to have_link('Sign Out')
    expect(page).to_not have_content('Sign In')

    click_on('Sign Out')

    expect(current_path).to eq(login_path)
  end
end
