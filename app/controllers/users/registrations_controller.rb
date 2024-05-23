class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :email, :password, :password_confirmation, :first_name, :last_name, :first_name_kana, :last_name_kana,
                                             :birth_date])
  end
end
