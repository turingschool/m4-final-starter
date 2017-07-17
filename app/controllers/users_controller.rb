class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.email}"
      redirect_to root_path
    else
      flash[:message] = "Try again"
      render :new
    end
  end

  def show
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
