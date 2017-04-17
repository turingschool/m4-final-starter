class Link < ActiveRecord::Base
  belongs_to :user

  def self.get_top_link()
    self.get_top_10().first.first
  end

  def self.get_top_10()
    group(:url).count.sort_by {|k, v| -v}[0,10]
  end
end
