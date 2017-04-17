class Link < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true
  validates :url, presence: true
  validate :valid_url?

  def mark_read_text
    return "Mark Unread" if self.read
    return "Mark Read" if !self.read
  end

  def mark_read_class
    return "link-read" if self.read
    return "link-unread" if !self.read
  end

  private

    def valid_url?
      uri = URI.parse(self.url)
      if !(uri.kind_of? URI::HTTP)
        errors.add(:url, 'Invalid')
      end
    end

end
