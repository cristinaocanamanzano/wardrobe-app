# frozen_string_literal: true

class ApplicationController < ActionController::Base
  attr_accessor :user_name
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def configure_permitted_parameters
   attributes = [:user_name, :email, :password]
   devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
   devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

end
