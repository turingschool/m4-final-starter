class LinksController < ApplicationController
  before_action :require_login

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @user = current_user
    @link = @user.links.create(link_params)
    if @link.save
      flash[:success] = "A new link has been added."
      redirect_to links_path
    else
      flash.now[:error] = @link.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def require_login
    unless current_user
      flash.now[:warning] = "You must be logged in to access this page."
      redirect_to home_index_path
    end
  end

  def link_params
    params.require(:link).permit(:title, :url, :user_id)
  end
end
