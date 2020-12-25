class AddReferencesToAffiliationNews < ActiveRecord::Migration[5.2]
  def change
    add_reference :affiliation_news, :affiliation, foreign_key: true
    add_reference :affiliation_news, :news, foreign_key: true
  end
end
