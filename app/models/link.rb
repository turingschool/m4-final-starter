class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, url: true
  validates_presence_of :title, message: " must not be blank"
end
