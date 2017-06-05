class LinksController < ApplicationController
  def index
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      flash[:success] = "You have updated a link"
      redirect_to links_path
    else
      flash[:failure] = "Try Again"
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:read, :title, :url)
  end
end
