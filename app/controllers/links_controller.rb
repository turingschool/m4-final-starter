class LinksController < ApplicationController
  before_action :require_login

  def index
    @link = Link.new
  end

  private

  def require_login
    unless current_user
      flash.now[:warning] = "You must be logged in to access this page."
      redirect_to home_index_path
    end
  end
end
