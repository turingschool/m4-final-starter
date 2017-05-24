class LinksController < ApplicationController
  def index
    if current_user
      @user = current_user
      @link = Link.new
    else
      redirect_to login_path
    end
  end

  def create
    @user = current_user
    @link = @user.links.new(link_params)
    if @link.save
      render partial: 'shared/link_markup', locals: {link: @link}
    else
      flash[:danger] = @link.errors.full_messages
      redirect_to links_path
    end
  end

  def edit
    @user = current_user
    @link = @user.links.find(params[:id])
  end

  def update
    @user = current_user
    @link = @user.links.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Successfully updated #{@link.title}."
    else
      flash[:danger] = @link.errors.full_messages
      redirect_to links_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
