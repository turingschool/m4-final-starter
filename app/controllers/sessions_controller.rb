class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email_address: params[:session][:email_address])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "You have successfuly logged in."
      redirect_to links_path
    else
      flash[:warning] = "Your login information is incorrect."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
