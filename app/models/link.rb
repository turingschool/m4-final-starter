class Link < ActiveRecord::Base
  validates :url, :url => true
  validates :url, :title, presence: true

  belongs_to :user
end
