class LinksController < ApplicationController
  before_action :require_login

  def index
    @links = current_user.links
  end

  private

  def require_login
    unless current_user
      flash[:danger] = "Please login first"
      redirect_to root_path
    end
  end
end
