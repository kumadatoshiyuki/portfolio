class MealsController < ApplicationController

  def index
  end

  def calendar
  end

  def events
    @meals = Meal.all
    @genres = ['staple_food','main_dish','side_dish','soup','fruit']

    array = [] # 変更
    num = 0
    @meals.each do |meal|
        sort = 1
        @genres.each do |genre|
            value = {
                'id'   => meal['id'],
                'title' => meal[genre],
                'description'=> meal[genre],
                'start' => meal['record_date'].strftime('%Y-%m-%d') + ' ' + "0#{sort}" + ':00:00',
                'end' => meal['record_date'],
                'className' => genre,
                # 'url'=> new_user_registration_path,
                # 'backgroundColor'=> "#F3F5F7",
                # 'borderColor'=> "#BAC2C   9",
                # 'textColor'=> "#3E4051"
            }
            array[num] = value
            sort += 1
            num += 1 # 変更
        end
    end

        respond_to do |format|
            format.html
            render json: array
        end
  end




  def chart

  end

  private
  def meal_params
    params.require(:user).permit(:staple_food, :main_dish, :side_dish, :fruit, :record_date)
  end
end