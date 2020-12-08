class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :staple_food
      t.string :main_dish
      t.string :side_dish
      t.string :fruit
      t.date :record_date
      t.timestamps
    end
  end
end
