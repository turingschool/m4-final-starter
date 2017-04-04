class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email_address: params[:email_address])
  end
end
