class Link < ApplicationRecord
  validates :title,
            :url, presence: true
  validates :url, :url=> {:allow_nil => true}

  belongs_to :user
end
