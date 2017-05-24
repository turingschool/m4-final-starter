class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user] = user.id
      flash[:success] = "You've successfully logged in!"
      redirect_to links_path
    else
      flash[:danger] = "You've entered an invalid user/password combination"
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end