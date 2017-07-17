class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    # require 'pry'; binding.pry

    if params[:user][:password] != params[:user][:password_confirmation]
      flash[:failure] = "Password and Password Confirmation must match"
      render :new
    end

    params[:users].each do |input|
     flash[:failure] = "#{input} cannot be blank" if input.empty?
    end

    
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
