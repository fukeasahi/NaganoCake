class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def after_sign_in_path_for(resource)
    # if admin_signed_in?
    #   admin_top_path
    # else end_user_signed_in?
    #   end_user_path
    # end
    case resource
      when Admin
        admin_top_path
      when EndUser
        end_users_path
    end
  end

  #sign_out後のredirect先変更する。rootパスへ。rootパスはhome topを設定済み。
  def after_sign_out_path_for(resource)
    # flash[:complete] = "Signed out successfully."
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :user_address, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :user_address, :phone_number])
  end

  # def after_update_path_for(resource)
  #   # flash[:complete] = "Signed out successfully."
  #   redirect_to end_users_path
  # end

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end
end
