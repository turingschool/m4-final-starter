class ReadService
  def self.add_hot_link(params)
    require 'pry'; binding.pry
    response = Faraday.post("https://localhost:3000/links?q=#{params}")
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end
end
