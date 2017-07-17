class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :check_login

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def check_login
    render "sessions/new" unless current_user || request.path[0..5] == "/users"
  end

end
