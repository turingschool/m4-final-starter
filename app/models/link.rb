class Link < ActiveRecord::Base
  validates :url, :url => true
  validates :url, :title, :read, presence: true
end
