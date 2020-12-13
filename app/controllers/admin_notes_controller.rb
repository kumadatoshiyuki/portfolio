class AdminNotesController < ApplicationController
  def top
  end

  def index
    @users = User.all.get_user().without_deleted
    # @user_notes = UserNote.all
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy
    
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :age, :phone, :image_id, :login_id, :email, :affiliation_id, :password, :role)
  end
  
  
end
