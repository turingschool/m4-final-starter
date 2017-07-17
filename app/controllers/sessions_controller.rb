class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You have logged in successfully."
      redirect_to root_path
    else
      flash[:danger] = "Invalid user/password combination! Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully."
    redirect_to login_path
  end
end
