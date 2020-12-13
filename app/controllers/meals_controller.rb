class MealsController < ApplicationController
  
  def index
  end
  
  def calendar
    @meal = Meal.all
  end
  
  def chart
    
  end
  
  private
  def meal_params
    params.require(:user).permit(:staple_food, :main_dish, :side_dish, :fruit, :record_date)
  end
end