class Link < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :url
  validates_format_of :url, with: URI::regexp

  belongs_to :user
end
