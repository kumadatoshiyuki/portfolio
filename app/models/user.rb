class User < ApplicationRecord
  enum role: { user: 1, admin: 99 }
  ROLE = {'user' => 1,'admin'=> 99}
  enum is_valid: { '有効': true, '退会済': false }

def active_for_authentication?
  super && self.is_valid == '有効'
end

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
