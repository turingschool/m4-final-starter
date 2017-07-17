class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # require 'pry'; binding.pry

    params[:user].each do |input|
      if params[:user][input].empty?
        flash[:failure] = "#{input} cannot be blank"
        render :new
      end
    end

    if @user.save
      flash[:sucess] = "Account Created!"
      redirect_to links_path


    elsif User.find_by(email: params[:email])
      flash[:failure] = "Email already taken"
      render :new

    elsif params[:user][:password] != params[:user][:password_confirmation]
      flash[:failure] = "Password and Password Confirmation must match"
      render :new
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
