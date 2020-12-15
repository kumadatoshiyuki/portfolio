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
    # @user_notes = UserNote.all
  end

  def show
    @user = User.find(params[:admin_id])
    @user_note = UserNote.where(record_date: get_today).where(user_id: params[:admin_id])
  end

  def confirm
    @user = User.find(params['admin_note']['user_id'])
    @admin_note = AdminNote.new(admin_note_params)

    params[:admin_note][:toilet_time] = toilet_time_join
    @toilet_time = ToiletTime.new(toilet_time_params)

    @user_notes = UserNote.where(record_date: get_today).where(user_id: @user.id).first
    @meal = Meal.find_by(record_date: get_today)


    amount = Amount.all
    results = amount.map{|amount| [amount.id, Hash[*[:amount_type, amount.amount_type]]]}
    @Amount = Hash[results] # => {1=>{:email=>"test@test.com"}, 2=>{:email=>"test2@test2.com"}}

    # binding.pry
    # if @admin_note.invalid?
    #   render :new
    # end

  end


  def edit

  end

  def update

  end

  def destroy

  end

private

  private
  def admin_note_params
    # formから送られてくるパラメータの取得（ストロングパラメーター）
    params.require(:admin_note).permit(
      :body_temperature,
      :sleep_start,
      :sleep_end,
      :message,
      :creator_id,
      :record_date,
      :user_id,
      :staple_food_amount_id,
      :main_dish_amount_id,
      :side_dish_amount_id,
      :fruit_amount_id,
      :soup_amount_id,
      toilet_time_attributes:
      [
        :toilet_time
      ]
    )
  end

  def toilet_time_params
    params.require(:admin_note).permit(:toilet_time)
  end

  def toilet_time_join

    # パラメータ取得
    date = params[:admin_note]
    # ブランク時のエラー回避のため、ブランクだったら何もしない
    if date["toilet_time(1i)"].empty? && date["toilet_time(2i)"].empty? && date["toilet_time(3i)"].empty?
      return
    end

    # 年月日別々できたものを結合して新しいDate型変数を作って返す
    Date.new date["toilet_time(1i)"].to_i,date["toilet_time(2i)"].to_i,date["toilet_time(3i)"].to_i

  end

end














