class AddReferencesToUserNote < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_notes, :user, foreign_key: true
  end
end
