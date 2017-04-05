class LinksController < ApplicationController
  before_action :require_login, unless: :logged_in?

  def index
    @links = Link.all.reverse
  end
end
