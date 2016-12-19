class Link < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :url
end
