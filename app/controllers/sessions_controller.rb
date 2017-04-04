class SessionsController < ApplicationController

  def new ; end

  def create
    if valid_user?
      session[:user_id] = user.id
      message = "You've successfully logged in!"
      flash[:success] = message
      redirect_to links_path
    else
      message = 'You failed to log in!'
      flash[:danger] = message
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private

  def user
    User.find_by(email: params[:email])
  end

  def valid_user?
    if user.nil?
      false
    elsif user.authenticate(params[:password]).is_a?(User)
      true
    end
  end
end
