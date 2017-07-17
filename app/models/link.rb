class Link < ActiveRecord::Base
  belongs_to :user
  #validates :url, :url => true
  validates :url, presence: true
  validates :url, :url => true
end
