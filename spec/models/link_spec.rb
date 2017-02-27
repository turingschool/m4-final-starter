require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'validates uri format' do
    good_link = Link.new(url: 'http://www.example.com', title: 'test')
    expect(good_link.save).to eq true

    bad_url = Link.new(url: 'foo', title: 'foo')
    expect(bad_url.save).to eq false

    close_but_wrong = Link.new(url: 'www.example.com', title: 'thing')
    expect(close_but_wrong.save).to eq false
  end
  it {should validate_presence_of :title}

  it 'sends read links to Hot Reads' do
    VCR.use_cassette('send_link')do

    link = create :link
    response = link.read_link
    expect(response[:status]).to eq 201
    end

  end
end
