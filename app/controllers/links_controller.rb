class LinksController < ApplicationController
  before_action :require_login

  private
  
  def require_login
    unless current_user
      flash[:notice] = "You must log in to visit this page!"
      redirect login_path
    end
  end
end
