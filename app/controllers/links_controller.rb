class LinksController < ApplicationController
  def index
    if current_user
      @user = current_user
      @link = Link.new
    else
      redirect_to login_path
    end
  end

  def create
    @user = current_user
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to links_path
    else

    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
