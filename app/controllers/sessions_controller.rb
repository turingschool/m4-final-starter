class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user] = user.id
      flash[:success] = "You've successfully logged in!"
      redirect_to links_path
    end
  end



end