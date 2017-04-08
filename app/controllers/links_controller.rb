class LinksController < ApplicationController
  before_action :require_login, unless: :logged_in?

  def index
    @links = current_user.links.reverse
  end
end
