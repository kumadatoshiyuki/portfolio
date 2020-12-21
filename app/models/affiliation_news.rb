class AffiliationNews < ApplicationRecord
  belongs_to :news
  belongs_to :affiliation
end
