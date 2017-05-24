class Link < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true
  validates :url, presence: true
  validate :valid_url?

  def mark_read_text
    return "Mark as Unread" if self.read
    return "Mark as Read" if !self.read
  end

  def mark_read_class
    return "link-read" if self.read
    return "link-unread" if !self.read
  end

  def top10?(top10_list)
    return 'TOP LINK!!!' if top10_list.first.eql?(self.url)
    return 'HOT!!!' if top10_list.include?(self.url)
    ''
  end

  private

    def valid_url?
      uri = URI.parse(self.url)
      if !(uri.kind_of? URI::HTTP)
        errors.add(:url, 'Invalid')
      end
    end

end
