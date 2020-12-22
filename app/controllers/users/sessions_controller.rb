# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #     binding.pry
  #   if resource.nil?
  #     redirect_to user_registration_path
  #     return
  #   end
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


protected

  def reject_user
    user = User.find_by(login_id: params[:user][:login_id].downcase)
    if user
      if (user.valid_password?(params[:user][:password]) && (user.active_for_authentication? == true))
        redirect_to new_user_session_path
      end
    end
  end

  # def reject_inactive_user
  #   @user = User.find_by(login_id: params[:user][:login_id])
  #   if @user
  #     if @user.valid_password?(params[:user][:password]) && !@user.is_valid
  #       redirect_to user_registration_path
  #     end
  #   end
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
