class CreateToiletTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :toilet_times do |t|
      t.datetime :toilet_time
      t.references :toilet_type, foreign_key: true
      t.references :admin_note, foreign_key: true
      t.timestamps
    end
  end
end
