class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      message = "You've successfully signed up!"
      flash[:success] = message
      redirect_to links_path
    else
      @errors = @user.errors
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
