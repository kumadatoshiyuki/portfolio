class AddAttendanceConfirmationToUserNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :user_notes, :attendance_confirmation, :boolean
  end
end
