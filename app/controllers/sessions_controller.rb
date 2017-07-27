class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:sucess] = "Successfully Logged In!"
      redirect_to links_path
    else
      flash.now[:failure] = "Login Unsucessful"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
