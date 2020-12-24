class AdminsController < ApplicationController
  before_action :if_not_admin
  def top
    # 管理者のページを表示させる
    @users = User.get_user().without_deleted
     @news = News.all
    # 変数の中にUserNoteを検索record_dateのヘルパーから持ってきたtodayをカラムのattendance_confirmationをグループ(group)化をcountでカウントする。
     res = UserNote.where(record_date: get_today).group(:attendance_confirmation).count(:attendance_confirmation)
     @absence = UserNote.where(attendance_confirmation: false).where(record_date: get_today)

     if res[true].nil?
       res[true] = 0
     end

     if res[false].nil?
       res[false] = 0
     end
     @attendance = res


      @kids = User.group(:role).count
      if @kids["user"].nil?
       @kids["user"] = 0
     end

     today = Time.now.at_beginning_of_day
     to   = today - 1.week
     #  ①過去1週間の欠席者の日付ごとの人数取得
     items = UserNote
     .where(attendance_confirmation: false)
     .where(record_date: to..today)
     .group(:record_date)
     .order(record_date: :ASC)
     .count

    today = Time.now.at_beginning_of_day
    gon.data = []
    #今日から１週間分のループをする。
    8.times do |n|
      # n=0 今日
      day = today
      # 今日であればスキップ
      if n != 0
        # n=1 昨日
        # n=2 一昨日
        day = today - n.day
      end

     # 全てのデータ
     no_data = true
     # ①のデータをループ
     items.each do | item |
      # ①のデータに対象の日付（day.strftime('%Y-%m-%d')）があるか確認
      if item[0].strftime('%Y-%m-%d') == day.strftime('%Y-%m-%d')
        # gon.data に①の情報を入れる
        gon.data << item
        no_data = false
        # ループを終了
        break
      end
     end

    # ①に対象の日付がなければ空のデータを入れる。[day <= 日付,0 <= 欠席者数]
     if no_data == true
        gon.data << [day,0]
     end
    end

    # 日付を古い順変更
    reverse_array = gon.data.reverse
    gon.reverse_data = []
    # gon.reverse_dataをViewに渡す
    gon.reverse_data = reverse_array

  end

  def index
    # 管理者の一覧ページ
    # without_deletedを使用することでtureのユーザのみ表示される
    @admins = User.get_admin().without_deleted.page(params[:page])

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
    @meal = Meal.find_by(record_date: get_today)
    @admin = User.find(params[:id])
    if @admin.update(user_params)
       redirect_to admins_path()
    else
      render ("admins/edit")
    end
  end

  def destroy
    # 管理者の削除
    @admin = User.find(params[:id])
      # soft_deleteメソッドをユーザモデルに作成し、is_validをfalseに変えることをしている。
     if @admin.soft_delete
       redirect_to admins_path()
     else
      render ("admins/show")
     end
  end
end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :age, :phone, :image, :login_id, :email, :affiliation_id, :password, :role)
  end

  def if_not_admin
    redirect_to top_path unless current_user.admin?
  end
