class RegistrationsController < Devise::RegistrationsController

  def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    @user = User.find(current_user.id)

    successfully_updated = @user.update_attributes(account_update_params)

    if successfully_updated
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to edit_user_registration_path
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def sign_up_params
    params.require(:user).permit!
  end

  private

  def needs_password?
    @user.email != params[:user][:email] || params[:user][:password].present?
  end

end
