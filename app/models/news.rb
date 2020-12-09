class News < ApplicationRecord
  has_many :affiliation_news
  has_many :affiliation, through: :affiliation_news
end
