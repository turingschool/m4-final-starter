class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    require 'pry'; binding.pry
    @user = User.create(user_params)

    # if params[:password] != params[password_confirmation]


  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
