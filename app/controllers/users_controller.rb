class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    params[:user].each do |input|
      if params[:user][input].empty?
        flash[:failure] = "#{input} cannot be blank"
      end
    end

    if params[:user][:password] != params[:user][:password_confirmation]
      flash.now[:failure] = "Password and Password Confirmation must match"
      render :new

    elsif User.find_by(email: params[:user][:email])
      flash.now[:failure] = "Email already taken"
      render :new

    elsif @user.save
      flash[:success] = "Account Created!"
      session[:user_id] = @user.id
      redirect_to links_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
