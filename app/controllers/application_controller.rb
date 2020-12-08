class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  # authorize_resource :class => false
  #   # 権限が無いページへアクセス時の例外処理
  #   rescue_from CanCan::AccessDenied do |exception|
  #   # root_urlにかっ飛ばす。
  #   redirect_to singin_path
  # end


  # RESPONSIBLE = ["ひよこ","うさぎ","こあら"]
  # @responsible = RESPONSIBLE

  def after_sign_in_path_for(resource)
    if current_user.is_admin? == true
      # //管理者画面
      admin_path
    elsif current_user.is_user? == true
      # //ユーザー画面
      users_path
    else
      # //ログアウト
      logout_path

    end
  end

  # def after_sign_out_path_for(resource)
  #   logout_path # ログアウト後に遷移するpathを設定
  # end

  # def after_sign_in_path_for(resource)
  #   if admin_user?
  #     users_path
  #   else
  #     tasks_path
  #   end
  # end


  protected
    def configure_permitted_parameters
      added_attrs = [:first_name, :last_name, :kana_first_name, :kana_last_name, :age, :phone, :login_id, :email, :affiliation_id, :password, :role, ]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs

      # login_added_attrs = [ :login_id ]
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
  # protected
  #   def configure_permitted_parameters
  #     added_attrs = [:login_id]
  #     devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #     devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  #     devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  #   end
end