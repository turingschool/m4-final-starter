require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'validates uri format' do
    read = Link.new(url: 'http://www.example.com')
    expect(read.save).to eq true

    bad_url = Link.new(url: 'foo')
    expect(bad_url.save).to eq false

    close_but_wrong = Link.new(url: 'www.example.com')
    expect(close_but_wrong.save).to eq false
  end
end
