class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :message
      t.datetime :creation_date
      t.timestamps
    end
  end
end
