json.array!(@meal) do |meal|
  json.extract! meal, :id
  json.title meal.staple_food
  json.start meal.record_date
  json.end meal.record_date
end