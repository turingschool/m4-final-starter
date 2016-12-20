require "rails_helper"

RSpec.describe "Update link", type: :request do

  xit "updates link 'read' attribute" do
    link = create(:link)
    put "/api/v1/links/#{link.id}", { "read": true }

    expect(link.read).to be(true)
  end
end
