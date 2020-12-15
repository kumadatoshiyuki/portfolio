class AdminNote < ApplicationRecord
  has_many :toilet_times
  accepts_nested_attributes_for :toilet_times
  belongs_to :user, optional: true

  # belongs_to :main_dish_amount, class_name: "Amount"
belongs_to :main_dish_amount, class_name: 'Amount', :foreign_key => 'main_dish_amount_id'
belongs_to :staple_food_amount, class_name: 'Amount', :foreign_key => 'staple_food_amount_id'
belongs_to :side_dish_amount, class_name: 'Amount', :foreign_key => 'side_dish_amount_id'
belongs_to :fruit_amount, class_name: 'Amount', :foreign_key => 'fruit_amount_id'
belongs_to :soup_amount, class_name: 'Amount', :foreign_key => 'soup_amount_id'

  # belongs_to :staple_food_amount, class_name: "Amount"
  # belongs_to :side_dish_amount, class_name: "Amount"
  # belongs_to :fruit_amount, class_name: "Amount"
  # belongs_to :soup_amount, class_name: "Amount"
end