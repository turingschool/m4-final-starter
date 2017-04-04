class LinksController < ApplicationController
  def index
    if current_user
      @user = current_user
      @link = @user.links.new
    else
      redirect_to login_path
    end
  end

  def create
  end
end
