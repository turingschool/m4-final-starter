class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = 'Successful sign in!'
      redirect_to links_path
    elsif
      flash[:error] = 'Unsuccessful sign in. Please try again!'
      @user = User.new
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = "Successful sign out."
    redirect_to root_path
  end

end