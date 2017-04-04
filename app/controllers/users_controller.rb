class UsersController < ApplicationController
  skip_before_action :login!, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    require 'pry'; binding.pry
  end
end
