class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :links
    else
      flash[:notice] = user.errors.full_messages.join(", ")
      redirect_to :login
    end
  end

  def destroy
    session.clear
    redirect_to :login
  end
end
