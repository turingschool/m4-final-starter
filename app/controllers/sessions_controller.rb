class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash['warning'] = 'Successful Login. Welcome!'
      redirect_to '/links'
    else
      flash['warning'] = 'Unsuccessful Login'
      render '/sessions/new'
    end
  end

  def destroy
    session.clear
    redirect_to root
  end
end
