class Link < ActiveRecord::Base
  belongs_to :user

  validates_presence_of(:title, :url)
  validates :read, inclusion: { in: [true, false] }

  scope :by_updated_at, -> { order("links.updated_at DESC") }
end
