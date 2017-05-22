require 'rails_helper'

RSpec.feature "AJAX" do
  it "link can be marked as read: true" do
    user = create(:user)
    link_1 = create(:link, user: user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    save_and_open_page

  end
end
