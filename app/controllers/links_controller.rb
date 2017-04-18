class LinksController < ApplicationController
  before_action :require_login, unless: :logged_in?

  def index
    @links = current_user.links.reverse
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "You successfully updated your link."
      redirect_to links_path
    else
      # flash_message_failed_update
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
