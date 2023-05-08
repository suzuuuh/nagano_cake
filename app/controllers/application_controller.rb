class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:top]
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end


  add_flash_types :success, :info, :warning, :danger

end

