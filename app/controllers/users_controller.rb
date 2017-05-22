class UsersController < ApplicationController 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully signed up!"
      redirect_to root_path
    # elsif User.exists?(['email LIKE ?'], "%#{@user.email}%")
    #   flash[:error] = "Email is already registered!"
    #   redirect_to new_user_path
    else
      flash[:error] = "You did something wrong. Please try again"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end