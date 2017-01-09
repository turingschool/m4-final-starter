module ApplicationHelper
  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    unless logged_in?
      flash[:warn] = 'Please login first'
      redirect_to login_path
    end
  end
end
