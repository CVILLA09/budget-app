class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception
  
    private
  
    
    def after_sign_in_path_for(resource)
      categories_path
    end
  
    def configure_permitted_parameters
      # Add the :name parameter to the permitted sign up parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  
      If you need to permit additional parameters for account update, add them here
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
  end
  