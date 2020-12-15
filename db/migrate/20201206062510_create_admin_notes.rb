class CreateAdminNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_notes do |t|

      t.float :body_temperature
      t.time :sleep_start
      t.time :sleep_end
      t.string :message
      t.integer :creator_id
      t.date :record_date
      t.references :user, foreign_key: true
      # 同じテーブルの際の記述
      t.references :staple_food_amount, foreign_key: { to_table: :amounts }
      t.references :main_dish_amount, foreign_key: { to_table: :amounts }
      t.references :side_dish_amount, foreign_key: { to_table: :amounts }
      t.references :fruit_amount, foreign_key: { to_table: :amounts }
      t.integer :timestamps
    end
  end
end
