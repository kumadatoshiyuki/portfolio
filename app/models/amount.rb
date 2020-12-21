class Amount < ApplicationRecord
  has_many :admin_notes, class_name: 'AdminNote', :foreign_key => 'main_dish_amount_id'
  has_many :admin_notes, class_name: 'AdminNote', :foreign_key => 'staple_food_amount_id'
  has_many :admin_notes, class_name: 'AdminNote', :foreign_key => 'side_dish_amount_id'
  has_many :admin_notes, class_name: 'AdminNote', :foreign_key => 'fruit_amount_id'
  has_many :admin_notes, class_name: 'AdminNote', :foreign_key => 'soup_amount_id'
  
  validates :amount_type, presence: true
  
  
  
  
  
end
