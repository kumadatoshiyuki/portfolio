class AdminNotesController < ApplicationController
  def new
    @admin_note = AdminNote.new()
    @user = User.find(params[:admin_id])
    @user_notes = UserNote.where(record_date: get_today).where(user_id: params[:admin_id])
    @meal = Meal.find_by(record_date: get_today)

  end

  def top
    @users = User.get_user().all
    # @user_notes = UserNote.all
  end

  def index
    @user = User.find(params[:admin_id])
    # @user_notes = UserNote.all
    @user_note = UserNote.where(record_date: get_today).where(user_id: params[:admin_id])
    @admin_note = AdminNote.all
  end

  def show
    @user = User.find(params[:admin_id])
    @user_note = UserNote.where(record_date: get_today).find_by(user_id: params[:admin_id])
    @admin_note = AdminNote.find(params[:id])
  end

  # def confirm
  #   @user = User.find(params['admin_note']['user_id'])
  #   @admin_note = AdminNote.new(admin_note_params)

  #   params[:admin_note][:toilet_time] = toilet_time_join
  #   @toilet_time = ToiletTime.new(toilet_time_params)

  #   @user_notes = UserNote.where(record_date: get_today).where(user_id: @user.id).first
  #   @meal = Meal.find_by(record_date: get_today)


  #   amount = Amount.all
  #   results = amount.map{|amount| [amount.id, Hash[*[:amount_type, amount.amount_type]]]}
  #   @Amount = Hash[results] # => {1=>{:email=>"test@test.com"}, 2=>{:email=>"test2@test2.com"}}

  #   # binding.pry
  #   # if @admin_note.invalid?
  #   #   render :new
  #   # end

  # end


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
      render ("admins_note/new")
    end
  end


  def edit


  end

  def update

  end

  def destroy

  end


  private

  def admin_note_params
    # formから送られてくるパラメータの取得（ストロングパラメーター）
    params.require(:admin_note).permit(:body_temperature, :sleep_start, :sleep_end, :message, :record_date, :staple_food_amount_id, :main_dish_amount_id, :side_dish_amount_id, :fruit_amount_id, :soup_amount_id)

  end
end