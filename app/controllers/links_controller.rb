class LinksController < ApplicationController

  def index
    if current_user
      @links = current_user.links
    else
      redirect_to guests_path
    end
  end
end
