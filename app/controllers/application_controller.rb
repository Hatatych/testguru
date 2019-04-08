class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :flash_message
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def default_url_options
    { lang: I18n.locale == I18n.default_locale ? {} : I18n.locale}
  end

  private

  def after_sign_in_path_for(resource)
    flash_message :notice, "Привет, #{resource.name}!"
    resource.admin? ? admin_tests_path : super
  end

  def flash_message(type, message)
    flash[type] = message
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :name, :last_name])
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
