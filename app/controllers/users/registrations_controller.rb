# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:cancel]
  layout 'application'
  before_action :if_not_admin
  # layout 'user.application'
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # @affiliations = Affiliation.all


  # GET /resource/sign_up
  # def new
    # super
  # end

  # POST /resource
  def create
    super
    user = resource
    if resource.save
      if user.image
        tags = Vision.get_image_data(user.image)
        flash[:api] = 'アップロードされた画像はAIにより' + tags.join(',') + 'と認識されました。'
      end
    end

  end

  #     def create
  #   super

  #   if resource.save
  #     user = resource
  #     tags = Vision.get_image_data(user.image)
  #     tags.each do |tag|
  #       list.tags.create(name: tag)
  #     end
  #   else
  #     binding.pry
  #   end
  # end
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def current_user_is_admin?
    user_signed_in? && current_user.is_admin?
  end

  def after_sign_up_path_for(resource)
    users_path
  end

  def if_not_admin
    redirect_to top_path unless current_user.is_admin?
  end
  def sign_up(resource_name, resource)
    if !current_user_is_admin?
      sign_in(resource_name, resource)
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :age, :phone, :image, :login_id, :email, :affiliation_id, :password, :role)
  end
end
