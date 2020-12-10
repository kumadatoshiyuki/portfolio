class User < ApplicationRecord
  enum role: { user: 1, admin: 99 }
  ROLE = {'user' => 1,'admin'=> 99}
  
  # 物理削除の代わりにユーザーの`deleted_at`をタイムスタンプで更新
  def soft_delete  
    update_attribute(:is_valid, false)  
  end

  # ユーザーのアカウントが有効であることを確認 
  def active_for_authentication? 
    super && is_valid
  end  
  
  # without_deletedメソッドを使いis_validがtrueのユーザを探している。
  def self.without_deleted
    self.where(is_valid: true)
  end

  # 削除したユーザーにカスタムメッセージを追加します  
  # def inactive_message   
  #   !deleted_at ? super : :deleted_account  
  # end 
  
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :admin_notes, dependent: :destroy
  has_many :user_notes, dependent: :destroy
  belongs_to :affiliation, optional: true


  def is_admin?
    role  = false
    if self.role == 'admin'
      role = true
    end
    return role
  end

  def is_user?
    role  = false
    if self.role == 'user'
      role = true
    end
    return role
  end

  def self.get_admin
    self.where(role: ROLE['admin'])
  end

  def self.get_user
    self.where(role: ROLE['user'])
  end

  # def self.is_valid
  #   self.update(is_valid: false)
  # end
end
