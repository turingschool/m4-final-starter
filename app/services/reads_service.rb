class ReadsService
  def self.create(read)
    new.send_to(read[:link][:url])
  end

  def self.hot
    new.get_hot_reads({})[:body]
  end

  def send_to(params, relative_path='/api/v1/reads')
    parse(post_request(params, relative_path))
  end

  def get_hot_reads(params, url='/api/v1/reads')
    parse(get_request(params, url))
  end

  def parse(response)
    status = response.status
    body = JSON.parse(response.body, symbolize_names: true)
    {status: status, body: body}
  end

  def post_request(params, relative_path)
    conn.post do |req|
      req.url relative_path
      req.headers['Content-Type'] = 'application/json'
      req.body = format_params(params)
    end
  end

  def get_request(params, relative_path)
    conn.get do |req|
      req.url relative_path
      req.body = params
    end
  end

  def conn
    Faraday.new(url: 'https://hotter-reads.herokuapp.com/')
  end

  def format_params(url)
    ({ read: { url: url } }).to_json
  end
end
