class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_global_variables
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  # vital for my navigation bar
  def set_global_variables
    @current_user = current_user
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :photo, :bio, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :photo, :bio, :email, :password, :current_password)
    end
  end
end