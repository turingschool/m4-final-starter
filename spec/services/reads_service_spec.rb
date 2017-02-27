require 'rails_helper'

RSpec.describe ReadsService, type: :model do
  it "create sends request to Hot Reads" do
    VCR.use_cassette('send_link') do
      link = create :link, read: true
      response = ReadsService.create(link: link)

      expect(response[:status]).to eq 201
    end
  end

  it "receives top ten reads" do
    VCR.use_cassette('get_hot_reads') do
      response = ReadsService.new.get_hot_reads({})

      expect(response[:status]).to eq 200
      expect(response[:body]).to be_an Array
    end
  end

  it "seamlessly replaces 'hot'" do
    pending "reset after finished"
    VCR.use_cassette('get_hot_reads') do
      response = ReadsService.hot

      expect(response.first).to eq('http://www.example.com/10')
      expect(response.count).to eq 10
    end
  end

end
