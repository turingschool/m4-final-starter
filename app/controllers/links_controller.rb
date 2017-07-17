class LinksController < ApplicationController
  before_filter :authorize

  def index
    @links = Link.all
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      flash[:success] = "Link saved successfully!"
      redirect_to root_path
    else
      flash[:danger] = "Something went wrong, and your link wasn't saved. Please try again."
      redirect_to root_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
