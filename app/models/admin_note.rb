class AdminNote < ApplicationRecord
  has_many :toilet_times
  belongs_to :user
  belongs_to :staple_food_amount, class_name: "Amount"
  belongs_to :main_dish_amount, class_name: "Amount"
  belongs_to :side_dish_amount, class_name: "Amount"
  belongs_to :fruit_amount, class_name: "Amount"
end
