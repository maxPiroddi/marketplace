class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Multiple methods to whitelist extra parameters required to be passed to Devise.
  #
  def create
    super
  end

  protected

  def configure_sign_up_params
    attributes = %i[name postcode]
    devise_parameter_sanitizer.permit(:sign_up, keys: :attributes)
  end


  def configure_account_update_params
    attributes = %i[name postcode]
    devise_parameter_sanitizer.permit(:account_update, keys: :attributes)
  end

end
