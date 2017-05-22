class UsersController < ApplicationController

  def new
    @user = User.new()
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/links'
    else
      user_registration_error
      redirect_to '/users/new'
    end
  end

  private

  def user_params
    params.require('user').permit(:email,
                                  :password,
                                  :password_confirmation)
  end

  def user_registration_error
    if user_params[:password] != user_params[:password_confirmation]
      flash['warning'] = "Password and password confirmation must match"
    else
      flash['warning'] = 'That e-mail has already been registered'
    end
  end
end
