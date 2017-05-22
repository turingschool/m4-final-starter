class Link < ActiveRecord::Base
  belongs_to :user

  validates :title,
            :url,
             presence: true

  def save_link(params, user)
    self.title = params[:title]
    self.url   = params[:url]
    self.user  = user
    self.save
  end
end
