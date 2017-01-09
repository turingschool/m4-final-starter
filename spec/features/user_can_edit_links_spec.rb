require 'rails_helper'

RSpec.describe Link do
  it 'can be edited' do
    me = create :user
    login me
    link = create :link, user: me

    visit edit_link_path link.id

    fill_in 'Title', with: 'New Title'

    click_on 'Update'

    expect(Link.find(link.id).title).to eq 'New Title'
  end
end
