class Affiliation < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :affiliation_news
  has_many :news, through: :affiliation_news
  
  validates :affiliation_name, presence: true
  
def Affiliation.search(search, user_or_post)
  if user_or_post == "1"
    # 検索したい項目をwhere文の中にいれる。
     Affiliation.where(['affiliation_name LIKE ?', "%#{search}%"])
  else
     Affiliation.all
  end
end

end
