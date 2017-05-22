class LinksController < ApplicationController

  def index
    if current_user
      @links = current_user.links
    else
      redirect_to guests_path
    end
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      redirect_to links_path
    else
      flash.now['warning'] = 'Link not saved'
      redirect_to links_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:url,
                                 :title)
  end
end
