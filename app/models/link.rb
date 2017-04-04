class Link < ApplicationRecord
  validates :title,
            :url, presence: true
  validates :url, url: true

  belongs_to :user
end
