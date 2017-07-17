class LinksController < ApplicationController
  before_filter :authorize

  def index
    @links = Link.where(user_id: current_user.id)
  end

  def create
    @link = Link.create(link_params)
    @link.user_id = current_user.id
    if @link.save
      flash[:success] = "Link saved successfully!"
      redirect_to root_path
    else
      flash[:danger] = "URL is not a valid URL."
      redirect_to root_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
