class LinksController < ApplicationController
  before_action :require_login, unless: :logged_in?

  def index;end
    # require 'pry'; binding.pry
end
