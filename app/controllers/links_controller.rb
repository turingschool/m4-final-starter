class LinksController < ApplicationController
  def index
    redirect_to signin_path if !current_user
  end
end
