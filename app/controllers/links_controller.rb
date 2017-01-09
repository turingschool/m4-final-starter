class LinksController < ApplicationController
  before_action :require_login
  def index
    @hot_links = Link.hot
  end

  def edit
    @link = Link.find_by(id: params[:id])
  end

  def update
    @link = Link.find_by(id: params[:id])
    if @link.update_attributes(link_params)
      flash[:success] = "Link '#{@link.title}' updated"
      redirect_to links_path
    else
      flash[:error] = @link.errors.full_messages.join('. ')
      render :edit
    end
  end

  private
    def link_params
      params.require(:link).permit(:url, :title)
    end
end
