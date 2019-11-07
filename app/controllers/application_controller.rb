class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  #   Whitelisting params for Devise
  #
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name postcode])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[name postcode])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name postcode])
  end
end
