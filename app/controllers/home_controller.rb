class HomeController < ApplicationController
  def index
    @users = User.includes(:meals).all
    @total_of_today = User.total_of_today
    last_cooking_record = CookingRecord.last
    @in_progress_cooking_record = if last_cooking_record.nil? || last_cooking_record.finished?
                                    nil
                                  else
                                    last_cooking_record
                                  end
    @cooking_records = CookingRecord.includes(:meals => :diner).order(created_at: :desc).limit(10)
    @total_eaten_meal = Meal.count
    finished_cooking_records = CookingRecord.includes(:meals).where("finished_at < ?", Time.now)
    @total_eaten_eggs = finished_cooking_records.sum { |cr| cr.meals.sum(:egg_count) }
    @total_eaten_corn = finished_cooking_records.sum { |cr| cr.meals.sum(:corn_count) }
    @total_eaten_sweet_potato = finished_cooking_records.sum { |cr| cr.meals.sum(:sweet_potato_count) }
  end
end
