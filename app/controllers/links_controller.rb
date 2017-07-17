class LinksController < ApplicationController

  def index
    @link = Link.new
  end

  def create
    @link
  end


  def link_params
    params.require(:link).permit(:title, :url, :read)
  end


end
