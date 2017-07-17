class LinksController < ApplicationController
  before_filter :authorize

  def index
    @links = Link.all
  end

end
