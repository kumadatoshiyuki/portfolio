class UsersController < ApplicationController
  # layout 'user.application', except: [:index,:top]
  layout 'user.application', only:  [:show,:edit]
  # 管理者の登録はこの画面で行う
  def top
    # 保護者の個人topページ
    @meal = Meal.find_by(record_date: get_today)
    @news = News.all
    @admin_note = AdminNote.where(user_id: current_user.id).find_by(record_date: get_today)

  end

  def index
    @users = User.get_user().without_deleted
    # 保護者の一覧ページ
    # without_deletedを使用することでtureのユーザのみ表示される
    @user_or_post = params[:option]
    if @user_or_post == "1"
      @affiliation = Affiliation.search(params[:search], @user_or_post).first
      if @affiliation.nil?
        render template: "users/index"
      else
        @users = User.get_user().without_deleted.where(affiliation_id: @affiliation.id).all
      end
    else
      @users = User.search(params[:search], @user_or_post)
    end

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
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :age, :phone, :image, :login_id, :email, :affiliation_id, :password, :role)
  end
end