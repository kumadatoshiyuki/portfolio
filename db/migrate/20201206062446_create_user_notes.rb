class CreateUserNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_notes do |t|
      t.float :body_temperature
      t.integer :number_toilet
      t.time :sleep_start
      t.time :sleep_end
      t.string :breakfast
      t.string :dinner
      t.string :message
      t.date :record
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
