class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @link = Link.new
  end

  def create
    user = current_user
    @link = user.links.new(link_params)

    if @link.save
      flash.notice = "Successfully added new link"
      redirect_to links_path
    else
      flash.now.error = @message.errors.join(' ,')
    end
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
