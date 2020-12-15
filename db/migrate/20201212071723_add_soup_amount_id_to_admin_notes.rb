class AddSoupAmountIdToAdminNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :admin_notes, :soup_amount, foreign_key: true
  end
end
