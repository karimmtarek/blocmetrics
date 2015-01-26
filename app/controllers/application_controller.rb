class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_signin
    unless current_user
      redirect_to signin_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def require_correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to root_path
    end
  end

  helper_method :require_correct_user

end
