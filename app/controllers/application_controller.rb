class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :family_name, :first_name, :family_name_kana, :first_name_kana])
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Owner)
      owner_subscriptions_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :owner
      new_owner_session_path
    else
      root_path
    end
  end
end
