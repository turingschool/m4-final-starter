class ReadsService
  def self.create(read)
    new(read[:link]).send
  end

  def initialize(link)

    @url = link[:url]
    @title = link[:title]

  end

  def send
    conn.post do |req|
      req.url '/api/v1/reads'
      req.headers['Content-Type'] = 'application/json'
      req.body = message
    end
  end

  def conn
    Faraday.new(url: 'http://localhost:3001')
  end

  def message
    ({ read: { url: @url } }).to_json
  end
end
