class AdminNotesController < ApplicationController
  def new
    @admin_note = AdminNote.new()
    @user = User.find(params[:admin_id])
    @user_notes = UserNote.where(record_date: get_today).where(user_id: params[:admin_id])
    @meal = Meal.find_by(record_date: get_today)

  end

  def top
    # @user_notes = UserNote.all
    @users = User.get_user().without_deleted.page(params[:page])
    @user_or_post = params[:option]
    if @user_or_post == "1"
      @affiliation = Affiliation.search(params[:search], @user_or_post).first
      if @affiliation.nil?
        render "admin_notes/top"
      else
        @users = User.where(affiliation_id: @affiliation.id).get_user().without_deleted.page(params[:page])
      end
    elsif @user_or_post == "2"
      @users = User.search(params[:search], @user_or_post).get_user().without_deleted.page(params[:page])
    else
      @users
    end



  end

  def index
    @user = User.find(params[:admin_id])
    # @user_notes = UserNote.all
    @user_note = UserNote.where(record_date: get_today).where(user_id: params[:admin_id])
    @admin_note = AdminNote.all




  end

  def show
                # ユーザーが取得できる。
      # URLからadmin_idを取得し(params[:admin_id])で
    # Userのページのデータを取得できる。
     @user = User.find(params[:admin_id])
    # URLからidを取得し(params[:id])
    # AdminNoteのページのデータを取得できる。
     @admin_note = AdminNote.find(params[:id])
    # AdminNoteから記録日(record_date)を取得する
     date = @admin_note.record_date
    # UserNoteから記録日(record_date　AdomiNoteと同じ記述日)を検索　かつ、ユーザのページのものを取得
     @user_note = UserNote.where(user_id: params[:admin_id]).find_by(record_date: date)
    # 食事の記録日をAdminNoteから記録日を取得
     @meal = Meal.find_by(record_date: date)
  end
  
  
  def common()
            # ユーザーが取得できる。
      # URLからadmin_idを取得し(params[:admin_id])で
    # Userのページのデータを取得できる。
     @user = User.find(params[:admin_id])
    # URLからidを取得し(params[:id])
    # AdminNoteのページのデータを取得できる。
     @admin_note = AdminNote.find(params[:id])
    # AdminNoteから記録日(record_date)を取得する
     date = @admin_note.record_date
    # UserNoteから記録日(record_date　AdomiNoteと同じ記述日)を検索　かつ、ユーザのページのものを取得
     @user_notes = UserNote.where(user_id: params[:admin_id]).find_by(record_date: date)
    # 食事の記録日をAdminNoteから記録日を取得
     @meal = Meal.find_by(record_date: date)
     
  end
  
  def create
    user = User.find(params[:admin_id])
    admin_note = AdminNote.new(admin_note_params)
    # 管理者の連絡帳記述の際は
    # 下のuser_idは園児
    # 記述したものは園児のもですよ
    admin_note.user_id = user.id
    # adminノートを記述したのはログインしている人ですよ
    admin_note.creator_id = current_user.id
    if admin_note.save
      redirect_to admin_admin_note_path(user,admin_note)
    else
      render ("admins_notes/new")
    end
  end


  def edit

     common()
  end


  def update
    @admin_note = AdminNote.find(params[:id])
    if @admin_note.update(admin_note_params)
      redirect_to admin_admin_note_path(@admin_note)
    else
      @user = User.find(params[:admin_id])
      @user_notes = UserNote.where(record_date: get_today).where(user_id: params[:admin_id])
      @meal = Meal.find_by(record_date: get_today)
      render ("admin_notes/edit")
    end
  end

  def destroy
    @admin_note = AdminNote.find(params[:id])
    if @admin_note.destroy
      redirect_to admin_admin_notes_path
    else
      render ("admin_notes/show")
    end
  end


  private

  def admin_note_params
    # formから送られてくるパラメータの取得（ストロングパラメーター）
    params.require(:admin_note).permit(:body_temperature, :number_toilet, :sleep_start, :sleep_end, :message, :record_date, :staple_food_amount_id, :main_dish_amount_id, :side_dish_amount_id, :fruit_amount_id, :soup_amount_id)

  end
end