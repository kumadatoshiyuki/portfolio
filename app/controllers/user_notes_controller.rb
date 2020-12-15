class UserNotesController < ApplicationController

  def new
    @user_note = UserNote.new()

  end

  def index
    @user = User.find(current_user.id)
  end


  def show
    @user_note = UserNote.find(params[:id])
    @user = User.find(current_user.id)
    
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

end