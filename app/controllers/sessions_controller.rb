class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        flash[:success] = "Log in successful"
        session[:user_id] = user.id
        redirect_to root_path
      else
        flash[:danger] = "Unsuccessful Log In"
        redirect_to login_path
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
