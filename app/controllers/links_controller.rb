class LinksController < ApplicationController
  before_action :authorized?

  def create
    link = params["link"]
    created_link = Link.new(url: link["url"], title: link["title"], user_id: current_user.id)
    if created_link.save
      flash[:danger] = "Link #{link["title"]} has been saved!"
      redirect_to '/'
    else
      flash[:danger] = "The url you have entered is incorrect" if !correct_url?(link["url"])
      flash[:danger] = "You didn't enter a title" if title_missing?
      flash[:danger] = "You didn't enter a URL" if url_missing?
      flash[:danger] = "You didn't enter any information" if title_and_url_missing?
    end
  end


  def index
    @links = Link.all
  end


  private

  def correct_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
    rescue URI::InvalidURIError
      false
  end

  def title_missing?
    params["link"]["title"] == ""
  end

  def url_missing?
    params["link"]["url"] == ""
  end

  def title_and_url_missing?
    url_missing? && title_missing?
  end
end
