class LinksController < ApplicationController
  def index
    @hot_links = current_user.links.hot
  end
end
