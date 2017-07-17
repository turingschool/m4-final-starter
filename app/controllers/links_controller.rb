class LinksController < ApplicationController

  def index
    @link = Link.new
    @links = current_user.links
  end

  def create
    @link = current_user.links.create(link_params)
    redirect_to links_path
  end


  def link_params
    params.require(:link).permit(:title, :url)
  end


end
