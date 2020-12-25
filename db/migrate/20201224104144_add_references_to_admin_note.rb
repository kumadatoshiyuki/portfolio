class AddReferencesToAdminNote < ActiveRecord::Migration[5.2]
  def change
    add_reference :admin_notes, :user, foreign_key: true
    add_reference :admin_notes, :staple_food_amount, foreign_key: { to_table: :amounts }
    add_reference :admin_notes, :main_dish_amount, foreign_key: { to_table: :amounts }
    add_reference :admin_notes, :side_dish_amount, foreign_key: { to_table: :amounts }
    add_reference :admin_notes, :fruit_amount, foreign_key: { to_table: :amounts }
  end
end
