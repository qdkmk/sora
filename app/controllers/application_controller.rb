class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
        added_attrs = [ :name, :email, :password, :password_confirmation　]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
      end
  private
    def check_admin
      if !current_user.try(:admin?)
        redirect_to root_path
        flash[:notice] = "管理者のみ閲覧できます"
      end
    end

    def logged_in_user?
      unless user_signed_in?
        flash[:notice] = 'Please log in.'
        redirect_to new_user_registration_path
      end
    end

end
