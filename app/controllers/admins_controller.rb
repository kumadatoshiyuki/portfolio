class AdminsController < ApplicationController
  before_action :if_not_admin
  def top
    # 管理者のページを表示させる
     @news = News.all
    # 変数の中にUserNoteを検索record_dateのヘルパーから持ってきたtodayをカラムのattendance_confirmationをグループ(group)化をcountでカウントする。
     res = UserNote.where(record_date: get_today).group(:attendance_confirmation).count(:attendance_confirmation)
     @absence = UserNote.where(attendance_confirmation: false)
     
     if res[true].nil?
       res[true] = 0
     end
     
     if res[false].nil?
       res[false] = 0 
     end
     @attendance = res
     
    # @attendance = UserNote.where(attendance_confirmation: true)
  end

  def index
    # 管理者の一覧ページ
    # without_deletedを使用することでtureのユーザのみ表示される
    @admins = User.get_admin().without_deleted

  end

  def show
    # 管理者詳細
    @admin = User.find(params[:id])

  end

  def edit
    # 管理者の編集
    @admin = User.find(params[:id])
  end

  def update
    @admin = User.find(params[:id])
    if @admin.update(user_params)
       redirect_to admins_path()
    else
       redirect_to admin_path(@admin)
    end
  end

  def destroy
    # 管理者の削除
    @admin = User.find(params[:id])
    # soft_deleteメソッドをユーザモデルに作成し、is_validをfalseに変えることをしている。
     if @admin.soft_delete
       redirect_to admins_path()
     else
       redirect_to admins_path()
     end
  end
end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :age, :phone, :image_id, :login_id, :email, :affiliation_id, :password, :role)
  end
  
  def if_not_admin
    redirect_to top_path unless current_user.admin?
  end