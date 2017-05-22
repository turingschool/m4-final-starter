require 'rails_helper'

RSpec.feature "Links" do
  it "can edit a link" do
    user = create(:user, email_address: "me@email.com")
    link_1 = create(:link, user: user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path
    binding.pry
    save_and_open_page
  end

end
