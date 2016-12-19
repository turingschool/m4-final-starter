class LinksController < ApplicationController
  before_action :authorized?, only: [:index]
  def index
  end
end
