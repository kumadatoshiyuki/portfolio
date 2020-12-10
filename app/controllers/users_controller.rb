class UsersController < ApplicationController
  # 管理者の登録はこの画面で行う
  def top
    # 保護者の個人topページ

  end

  def index
    # 保護者の一覧ページ
    @users = User.get_user()

  end

  def show
    # 保護者詳細
    @user = User.find(params[:id])

  end

  def edit
    # 保護者の編集
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path()
    else
      redirect_to user_path(@user)
    end
  end


  def destroy
    # 保護者の削除

  end

  # def soft_destroy
  #   @user = User.find(params[:id])
  #   if @user.update(is_valid: false)
  #     reset_session
  #     redirect_to users_path
  #   else
  #     redirect_to users_path
  #   end
  # end


private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :age, :phone, :image_id, :login_id, :email, :affiliation_id, :password, :role)
  end
end