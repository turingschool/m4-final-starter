class LinksController < ApplicationController
  before_action :require_login, unless: :logged_in?

  def index
    @links = current_user.links.reverse
  end

  def edit
    @link = found_link
  end

  def update
    @link = found_link
    if @link.update(link_params)
      flash[:success] = "You successfully updated your link."
      redirect_to links_path
    else
      @errors = @link.errors
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def found_link
    Link.find(params[:id])
  end
end
