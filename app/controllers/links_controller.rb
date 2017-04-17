class LinksController < ApplicationController
  before_action :logged_in?

  def index
    @links = Link.where(user_id: current_user.id)
    @link = Link.new
  end

  def create
    if link_params.include?(:id)
      @link = Link.where(:user_id => session[:user_id].to_i).find(link_params[:id].to_i)
      @link.title = link_params[:title]
      @link.url = link_params[:url]
    else
      @link = Link.new(link_params)
      @link.user_id = session[:user_id].to_i
    end
    if !@link.save
      flash[:error] = @link.errors.full_messages
      @links = Link.where(user_id: current_user.id)
      render :index
    else
      redirect_to links_path
    end
  end

  private

    def logged_in?
      redirect_to signin_path if !current_user
    end

    def link_params
      if params[:link][:id] == ""
        return params.require(:link).permit(:title, :url)
      else
        return params.require(:link).permit(:title, :url, :id)
      end
    end
end
