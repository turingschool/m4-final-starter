class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to links_path
      flash[:success]   = "successfully logged in!"
    else
      render :new
      flash[:alert] = "Sorry, password and username don't match"
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
