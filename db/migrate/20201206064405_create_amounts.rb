class CreateAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :amounts do |t|
      t.string :amount_type
      t.timestamps
    end
  end
end
