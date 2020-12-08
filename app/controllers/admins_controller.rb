class AdminsController < ApplicationController
  def top
    # 管理者のページを表示させる
  end

  def new
    # 新規登録ページ

  end

  def index
    # 管理者の一覧ページ
    @admins = User.where(role: 99)

    # @chats = Chat.where(room_id: @chat.room_id)

  end

  def show
    # 管理者詳細
    @admin = User.find(params[:id])

  end

  def create
    # 管理者の登録
    # user = User.new(user_params)
    # user.role = 99
    # user.save()

  end

  def edit
    # 管理者の編集

  end

  def destroy
    # 管理者の削除

  end
end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :age, :phone, :image_id, :login_id, :email, :affiliation_id, :password, :role)
  end