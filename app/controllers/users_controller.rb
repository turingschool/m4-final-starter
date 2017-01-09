class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to :root
    else
      flash.now[:danger] =  @user.errors.full_messages.join(", ")
      redirect_to :signup
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
