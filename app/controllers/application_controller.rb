require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :json,:html

  protect_from_forgery with: :exception

  ########################
  # acts_as_token_authentication_handler_for User
  ########################

  ############################## authentication api & spec##################
   # for sms_token accept in the sign_up interface
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  #   def configure_permitted_parameters
  #     devise_parameter_sanitizer.permit(:sign_up, keys: [:sms_token])
  #   end
    ################################
end
