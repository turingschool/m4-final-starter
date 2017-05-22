class LinksController < ApplicationController
  before_action :require_login

  def index
    @link = Link.new
  end

  private

  def require_login
    unless current_user
      redirect_to login_path
      flash[:notice] = "You must log in to visit this page!"
    end
  end
end
