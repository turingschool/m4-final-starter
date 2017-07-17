class Api::V1::UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
