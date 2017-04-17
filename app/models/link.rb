class Link < ActiveRecord::Base
  validates :user_id, presence: true
  validate :valid_url?

  private

    def valid_url?
      uri = URI.parse(self.url)
      if !(uri.kind_of? URI::HTTP)
        errors.add(:url, 'Invalid')
      end
    end

end
