class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
      flash[:notice] = "You have successfully logged in."
    else
      redirect_to '/login'
      flash[:notice] = "You have entered in some incorrect information, please try again."
    end
  end

  def destroy
    session.destroy
    redirect_to '/login'
    flash[:notice] = "You have successfully logged out."
  end
end
