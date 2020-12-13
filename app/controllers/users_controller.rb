class UsersController < ApplicationController
  # 管理者の登録はこの画面で行う
  def top
    # 保護者の個人topページ
  end

  def index
    # 保護者の一覧ページ
    # without_deletedを使用することでtureのユーザのみ表示される
    @users = User.get_user().without_deleted

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
    @user = User.find(params[:id])
    # soft_deleteメソッドをユーザモデルに作成し、is_validをfalseに変えることをしている。
     if @user.soft_delete
       redirect_to users_path()
     else
       redirect_to users_path()
     end
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :age, :phone, :image_id, :login_id, :email, :affiliation_id, :password, :role)
  end
end