class Link < ActiveRecord::Base
  validates :url, presence: true, uniqueness: true, url: true
  validates :title, presence: true, uniqueness: true
  belongs_to :user
end
