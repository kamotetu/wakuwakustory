class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:my_image])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:remove_my_image])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_text])

    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:my_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:remove_my_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_text])

  end

  def layout_by_resource
    if devise_controller?
      "sub_application"
    else
      "application"
    end
  end

end
