class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def onfigure_permitted_params
    devise_parameter_sanitize.for(:sign_up) { |s| s.permit(:email, :phone_number, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |a| a.permit(:email, :phone_number, :password, :password_confirmation, :current_password) }
  end
end
