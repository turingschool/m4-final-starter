class LinksController < ApplicationController

  def index
    if current_user
      @links = Link.all
    else
      flash["message"] = "Please Login or Sign Up"
      redirect_to '/login'
    end
  end
end
