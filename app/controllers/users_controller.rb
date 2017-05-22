class UsersController < ApplicationController 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully signed up!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      if !@user.errors.details[:email].nil? && @user.errors.details[:email][0][:error] == :blank
        flash[:error] = "Email cannot be blank"
        redirect_to new_user_path
      elsif @user.errors.details[:password][0][:error] == :blank
        flash[:error] = "Password cannot be blank"
        redirect_to new_user_path
      elsif @user.errors.details[:password_confirmation][0][:error] == :blank
        flash[:error] = "Password Confirmation cannot be blank"
        redirect_to new_user_path
      elsif @user.errors.details[:email][0][:error] == :taken
        flash[:error] = "#{@user.errors.details[:email][0][:value]} is already taken"
        redirect_to new_user_path
      elsif @user.errors.details[:password_confirmation][0][:error] == :confirmation
        flash[:error] = "Password and Password Confirmation do not match"
        redirect_to new_user_path
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end