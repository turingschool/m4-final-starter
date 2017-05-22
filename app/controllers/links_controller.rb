class LinksController < ApplicationController
  before_action :require_login

  def index
    @link = Link.new
  end

  private

  def require_login
    unless current_user
      flash[:notice] = "You must log in to visit this page!"
      redirect_to login_path
    end
  end
end
