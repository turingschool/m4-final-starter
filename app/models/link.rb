require "uri"
class Link < ActiveRecord::Base
belongs_to :user
validates :title, :url, presence: true
validate :valid_url?

  def valid_url?
    uri = URI.parse(url)
    unless uri.is_a?(URI::HTTP)|| uri.is_a?(URI::HTTPS) #  && !uri.host.nil?
      errors.add(:url, "Must be a valid url")
    end
    rescue URI::InvalidURIError
      false
  end
end
