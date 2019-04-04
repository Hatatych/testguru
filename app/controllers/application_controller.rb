class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :flash_alert

  private

  def authenticate_user!
    cookies[:redirect_url] = request.path
    redirect_to login_path, alert: 'You are not logged in' unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def flash_alert(message)
    flash[:alert] = message
  end
end
