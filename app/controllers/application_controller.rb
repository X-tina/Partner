class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_params, if: :devise_controller?


  protected

  def permission_denied!(ex)
    flash[:alert] = "You are not allowed!"
    redirect_to root_url
  end

  def configure_permitted_params
  	#devise_parameter_sanitizer.for(:sign_up) << :phone_number
  	#devise_parameter_sanitizer.for(:account_update) << :username
    devise_parameter_sanitizer.for(:sign_up) { |s| s.permit(:email, :phone_number, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |a| a.permit(:email, :phone_number, :password, :password_confirmation, :current_password) }
  end
end
