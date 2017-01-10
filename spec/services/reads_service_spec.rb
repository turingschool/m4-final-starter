require 'rails_helper'

RSpec.describe ReadsService, type: :model do
    it "create sends request to Hot Reads" do
      VCR.use_cassette('send_link') do
      link = create :link, read: true
      response = ReadsService.create(link: link)
      expect(response.status).to eq 201
    end
  end
end
