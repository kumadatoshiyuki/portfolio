class Affiliation < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :affiliation_news
  has_many :news, through: :affiliation_news
end
