require 'rails_helper'

RSpec.describe ReadsService, type: :model do
  it "create sends request to Hot Reads" do
    link = create :link, read: true
    VCR.use_cassette('send_link') do
      response = ReadsService.create(link: link)
      byebug
      expect(response.status).to eq 201
    end
  end
end
