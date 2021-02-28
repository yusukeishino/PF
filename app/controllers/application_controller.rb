class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[top news index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_root_path
    else
      hobby_images_path
    end
  end

  def after_inactive_sign_up_path_for(_resource)
    hobby_images_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
