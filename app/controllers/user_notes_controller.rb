class UserNotesController < ApplicationController
before_action :if_not_user

  def new
    @user_note = UserNote.new()

  end

  def index
    @user = User.find(current_user.id)
  end

  def events
        # 1ログインしているユーザのadminノートのデータ（日付）を取得
        @admin_note = AdminNote.where(user_id: current_user.id).pluck(:record_date)
        # 2ログインしているユーザのuserノートのデータ（日付）を取得
        @user_note = UserNote.where(user_id: current_user.id).pluck(:record_date)


        # １と２を合体
        @admin_note.push(@user_note)
        # 一つの配列にまとめる
        @admin_note.flatten!

        dates = []
        @admin_note.each do | record_date |
          # 日付のフォーマット（%Y-%m-%d）を変更しdatesに保存
          # dates = []
          # [2020-12-14]
          # [2020-12-14,2020-12-15]
          # [2020-12-14,2020-12-15,2020-12-16]
          # 全てのデータをdatesに入れる記述↓
          dates <<  record_date.strftime('%Y-%m-%d')
        end

        # 重複の日付は削除
        dates.uniq!


        array = [] # 変更
        num = 0
        dates.each do |record_date|
            value = {
                'id'   => current_user.id,
                'title' => '連絡帳をみる',
                'start' => record_date,
                'end' => record_date,
                'url'=> user_note_show_path(date: record_date),
                'backgroundColor'=> "#F3F5F7",
                'borderColor'=> "#BAC2C9",
                'textColor'=> "#3E4051"
            }
            array[num] = value
            num += 1 # 変更
        end


        respond_to do |format|
            format.html
            render json: array
        end
  end

  def show
        @user = User.find(current_user.id)
        @admin_note = AdminNote.where(user_id: current_user.id).find_by(record_date: params[:date])
        @user_note = UserNote.where(user_id: current_user.id).find_by(record_date: params[:date])
        @meal = Meal.find_by(record_date: get_today)
  end

  def confirm
    @user_note = UserNote.new(user_note_params)
    @confirmation = CONFIRMATION
    if @user_note.invalid?
      render :new
    end
  end

  def create
      @user_note = UserNote.new(user_note_params)
      @user_note.user_id = current_user.id
    if @user_note.save
      redirect_to top_path()
    else
      render ("user_notes/new")
    end
  end

  private
  def user_note_params
    params.require(:user_note).permit(:body_temperature, :number_toilet, :sleep_start, :sleep_end, :breakfast, :dinner, :message, :record_date, :attendance_confirmation, :user_id)
  end

  def if_not_user
    redirect_to admins_top_path unless current_user.is_user?
  end
end