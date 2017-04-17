class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
      flash[:notice] = 'You have successfully signed up!'
    else
        flash[:notice] = "Uh oh, your passwords don't match!" if passwords_do_not_match?
        flash[:notice] = "Uh oh, you forgot to enter a password!" if password_missing?
        flash[:notice] = "Uh oh, you forgot to enter the password confirmation!" if password_confirmation_missing?
        flash[:notice] = "Uh oh, you forgot to enter a password and password confirmation!" if both_passwords_missing?
        flash[:notice] = "Uh oh, you forgot to enter an email address!" if email_missing?
        flash[:notice] = "Uh oh, you didn't enter any information!" if everything_missing?
      redirect_to '/signup'
    end
  end




  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def password_missing?
    params[:user][:password] == ''
  end

  def password_confirmation_missing?
    params[:user][:password_confirmation] == ''
  end

  def passwords_do_not_match?
    params[:user][:password] != params[:user][:password_confirmation]
  end

  def email_missing?
    params[:user][:email] == ''
  end

  def both_passwords_missing?
    password_missing? && password_confirmation_missing?
  end

  def everything_missing?
    both_passwords_missing? && email_missing?
  end
end
