class HotreadsService
  HOT_READS_URL = 'https://hotreads-laszlo.herokuapp.com'
  HOT_READS_ENDPOINT_LINK_CREATE = '/api/v1/links'
  HOT_READS_ENDPOINT_LINK_INDEX = '/api/v1/links'

  def initialize
    @conn = Faraday.new(:url => HOT_READS_URL)
  end

  def send_link(url)
    @conn.post HOT_READS_ENDPOINT_LINK_CREATE, { :url => url }
  end

  def get_top10
    response = @conn.get HOT_READS_ENDPOINT_LINK_INDEX
    return JSON.parse(response.body)
  end
end