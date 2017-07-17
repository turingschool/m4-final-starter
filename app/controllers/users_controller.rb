class UsersController < ApplicationController
  def new

  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "You have logged in successfully."
      redirect_to root_path
    elsif user_params[:password] != user_params[:password_confirmation]
        flash[:danger] = "Password confirmation doesn't match password."
        redirect_to signup_path
    else
      flash[:danger] = "Sorry, but that email has already been taken."
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
