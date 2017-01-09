class LinksController < ApplicationController
  before_action :authenticate

  def index
    @links = current_user.links.all
    @hot_links = Link.hot
  end
end
