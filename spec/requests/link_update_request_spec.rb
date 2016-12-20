require "rails_helper"

RSpec.describe "Update link", type: :request do

  it "updates link 'read' attribute" do
    link = create(:link)
    put "/api/v1/links/#{link.id}", '{ "link": { "read": true } }'

    expect(link.read).to eq(true)
  end
end
