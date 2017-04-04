class LinksController < ApplicationController
  before_action :require_login, unless: :logged_in?

  def index
    @links = Link.new
  end

  def create
    require 'pry'; binding.pry
  end
    # require 'pry'; binding.pry
end
