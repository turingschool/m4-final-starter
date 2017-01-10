class ReadsService
  def self.create(read)
    new(read[:link]).send
  end

  def self.hot
    new({}).get_hot_reads
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

  def get_hot_reads
    JSON.parse(response.body)
  end

  def response
    conn.get '/api/v1/reads'
  end

  def conn
    Faraday.new(url: 'https://hotter-reads.herokuapp.com/')
  end

  def message
    ({ read: { url: @url } }).to_json
  end
end
