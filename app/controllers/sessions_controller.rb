class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "successfully logged in!"
      redirect_to links_path
    else
      flash[:alert] = "Sorry, password and username don't match"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
