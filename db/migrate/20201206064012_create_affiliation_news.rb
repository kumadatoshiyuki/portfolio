class CreateAffiliationNews < ActiveRecord::Migration[5.2]
  def change
    create_table :affiliation_news do |t|
      t.references :affiliation, foreign_key: true
      t.references :news, foreign_key: true
      t.timestamps
    end
  end
end
