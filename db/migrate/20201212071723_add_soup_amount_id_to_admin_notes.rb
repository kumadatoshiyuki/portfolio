class AddSoupAmountIdToAdminNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_notes, :soup_amount_id, :integer
  end
end
