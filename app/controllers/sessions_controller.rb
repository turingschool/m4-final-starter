class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email_address: params[:email_address])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'Successfully logged in!'
      redirect_to links_path
    else
      flash[:danger] = 'Failed to login!'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
