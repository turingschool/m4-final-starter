class LinksController < ApplicationController

  def index
    if current_user
      @links = Link.where(user: current_user)
      @add_link = Link.new
      binding.pry
    end
  end

  def create
    link = Link.new(link_params)
    link.user = current_user
    if link.url
      link.save
      redirect_to links_path
    else
      flash[:error] = "Link is not valid"
      redirect_to link_path
    end
end

    def link_params
      params.require(:link).permit(:url, :title, :read, :user)
  end
end
