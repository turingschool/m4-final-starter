class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # require 'pry'; binding.pry
    @user = User.create!(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to links_path , success: "You have successfully signed up!"
    else
      @errors = @user.errors
      redirect_to signup_path, danger: "Failed to create account!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
