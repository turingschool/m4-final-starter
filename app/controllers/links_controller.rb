class LinksController < ApplicationController
  before_action :authorized?
  def index
    @links = Link.all
  end
end
