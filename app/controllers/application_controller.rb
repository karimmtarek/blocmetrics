class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def options
  #   head :no_content
  # end

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to signin_path, alert: "Please sign-in first!"
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

  def domain_belongs_to_user?(user, event)
    user.domains.any? { |domain| domain.url == event.source_url }
  end

  helper_method :domain_belongs_to_user?

  def require_correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to root_path
    end
  end

  helper_method :require_correct_user

end
