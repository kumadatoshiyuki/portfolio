class Affiliation < ApplicationRecord
  has_many :users
  has_many :affiliation_news
end
