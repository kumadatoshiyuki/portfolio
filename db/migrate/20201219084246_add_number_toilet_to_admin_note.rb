class AddNumberToiletToAdminNote < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_notes, :number_toilet, :integer
  end
end
