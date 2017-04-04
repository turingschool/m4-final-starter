class SessionsController < ApplicationController

  def new ; end

  def create
    if valid_user?
      session[:user_id] = user.id
      message = 'You succesfully logged in!'
      flash[:success] = message
      redirect_to links_path
    else
      message = 'You failed!'
      flash[:danger] = message
      render :new
    end
  end

  private

  def user
    User.find_by(email: params[:email])
  end

  def valid_user?
    user && user.authenticate(params[:password])
  end
end
