class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SesionsHelper

  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
  u.permit(:name, :username, :password, :password_confirmation)
end
  end

end
