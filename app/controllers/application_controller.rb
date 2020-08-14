class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    #for  crud with user
    def authorize_admin
        return unless !current_user.admin?
        redirect_to root_path, alert: 'Admins only!'
    end
    #to login with name or email
    def configure_permitted_parameters
        added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
