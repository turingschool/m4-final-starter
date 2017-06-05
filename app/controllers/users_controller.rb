class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome: #{@user.email}"
      redirect_to links_path
    else
      flash[:failure] = error_messages(user_params).join(" ")
      render :new
    end
  end

  private

  def error_messages(user)
    error_message = []
    if user[:email] == ""
      error_message << "Please enter an e-mail address."
    end

    if user[:password] == ""
      error_message << "Please enter a password."
    end

    if user[:password_confirmation] == ""
      error_message << "Please enter a password confirmation."
    end

    if user[:password_confirmation] != user[:password]
      error_message << "Your password and password confirmation do not match."
    end

    if User.find_by(email: user[:email])
      error_message << "An account already exists using this e-mail address."
    end
    error_message
  end

  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation)
  end

end
