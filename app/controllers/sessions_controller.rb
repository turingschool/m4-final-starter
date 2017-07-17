class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = 'LogIn succesful'
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:success] = 'LogIn unsuccesful'

      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
