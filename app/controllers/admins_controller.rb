class AdminsController < ApplicationController
  def top
    # 管理者のページを表示させる
  end

  def index
    # 管理者の一覧ページ
    @admins = User.get_admin()

    # @chats = Chat.where(room_id: @chat.room_id)
  end

  def show
    # 管理者詳細
    @admin = User.find(params[:id])

  end

  def edit
    # 管理者の編集
    @admin = User.find(params[:id])
    # if @admin.user != current_user
    #   redirect_to admin_show_path
    # end
  end

  # def confirm
  #   @admin = User.new(user_params)
  #   @admin.user_id = current_user.id
  #   # if @order.invalid?
  #   # render :new
  #   # end
  # end



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

  end
end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :age, :phone, :image_id, :login_id, :email, :affiliation_id, :password, :role)
  end