class User < ApplicationRecord
  enum role: { user: 1, admin: 99 }
  ROLE = {'user' => 1,'admin'=> 99}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :admin_notes
  has_many :user_notes
  belongs_to :affiliation

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

end
