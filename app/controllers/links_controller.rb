class LinksController < ApplicationController
  before_action :logged_in?

  def index
    @links = current_user_links
    @link = Link.new
  end

  def create
    if link_params.include?(:id)
      @link = Link.where(:user_id => session[:user_id].to_i).find(link_params[:id].to_i)
      @link.title = link_params[:title]
      @link.url = link_params[:url]
      @link.read = false
    else
      @link = Link.new(link_params)
      @link.user_id = session[:user_id].to_i
    end
    if !@link.save
      flash[:error] = @link.errors.full_messages
      @links = current_user_links
      render :index
    else
      flash[:success] = 'Link successfully saved'
      render partial: '/links/link', locals: {link: @link}
      # redirect_to links_path
    end
  end

  private

    def logged_in?
      redirect_to signin_path if !current_user
    end

    def link_params
      # if params[:link][:id] == ""
      if params[:id] == ""
        # return params.require(:link).permit(:title, :url)
        return params.permit(:title, :url)
      else
        # return params.require(:link).permit(:title, :url, :id)
        return params.permit(:title, :url, :id)
      end
    end

    def current_user_links
      Link.where(user_id: current_user.id).order(id: :desc)
    end
end
