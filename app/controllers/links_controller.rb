class LinksController < ApplicationController
  before_action :require_login, unless: :logged_in?

  def index
    # require 'pry'; binding.pry
  end
end
