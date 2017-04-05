class LinksController < ApplicationController
  before_action :logged_in?

  def index
    @links = Link.where(user_id: current_user.id)
  end

  private

    def logged_in?
      redirect_to signin_path if !current_user
    end
end
