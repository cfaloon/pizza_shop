class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    keys = %i(email password password_confirmation first_name last_name phone_number)
    devise_parameter_sanitizer.permit(:sign_up, keys)
  end
end
