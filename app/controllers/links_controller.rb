class LinksController < ApplicationController
  before_action :logged_in?

  def index
    @links = Link.where(user_id: current_user.id)
    @link = Link.new
  end

  def create
    # @link = Link.where(:user_id => session[:user_id].to_i).find_or_create_by(link_params)
    @link = Link.new(link_params)
    @link.user_id = session[:user_id].to_i
    if !@link.save
      flash[:error] = @link.errors.full_messages
    end
    redirect_to links_path
  end

  private

    def logged_in?
      redirect_to signin_path if !current_user
    end

    def link_params
      params.require(:link).permit(:title, :url)
    end
end
