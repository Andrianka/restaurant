class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions

  before_action :configure_permitted_parameters, if: :devise_controller?

   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password,
       :password_confirmation,
       person_attributes: [:first_name, :last_name, :tel])
     }
     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email,
       :current_password,
       person_attributes: [:first_name, :last_name, :tel])
     }
   end
end
