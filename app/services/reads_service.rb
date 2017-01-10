class ReadsService
  def self.create(link)
    new(link[:link]).send
  end

  def initialize(link)

    @url = link[:url]
    @title = link[:title]

  end

  def send
    conn.post do |req|
      req.url '/api/v1/reads'
      req.body = message
    end
  end

  def conn
    Faraday.new(url: 'https://hotter-reads.herokuapp.com') do |config|
      config.headers['Content-Type'] = 'application/json'
    end
  end

  def message
    ({ read: { url: @url } }).to_json
  end
end
