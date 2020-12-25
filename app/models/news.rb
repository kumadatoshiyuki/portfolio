class News < ApplicationRecord
  has_many :affiliation_news
  has_many :affiliation, through: :affiliation_news

  validates :message,presence: true, length: { maximum: 600 }
  validates :creation_date, presence: true
  # validates :affiliation_ids, presence: true
end
