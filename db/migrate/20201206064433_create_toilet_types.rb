class CreateToiletTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :toilet_types do |t|
      t.string :toilet_type
      t.timestamps
    end
  end
end
