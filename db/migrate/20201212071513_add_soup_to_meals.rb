class AddSoupToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :soup, :string
  end
end
