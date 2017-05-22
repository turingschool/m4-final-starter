class LinksController < ApplicationController
  before_action :require_login

  def index
    @link = Link.new
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to links_path
    else
      flash[:notice] = @link.errors.full_messages.join(". ")
      render :index
    end
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    if @link.save
      flash[:success] = "Link Updated!"
      redirect_to links_path
    else
      flash[:notice] = @link.errors.full_messages.join(". ")
      render :edit
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  private

  def require_login
    unless current_user
      redirect_to login_path
      flash[:notice] = "You must log in to visit that page!"
    end
  end

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
