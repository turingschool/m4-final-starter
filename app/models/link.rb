class Link < ActiveRecord::Base
  validates :user_id, presence: true
  # before_save :valid_url?

  # private

  #   def valid_url?

  #     uri = URI.parse(self.url)
  #     binding.pry
  #     if !(uri.kind_of? URI::HTTP)
  #     #  rescue URI::InvalidURIError
  #        throw :abort
  #       end
  #   end

end
