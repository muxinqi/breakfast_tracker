class HomeController < ApplicationController
  def index
    @users = User.includes(:meals).all
    @total_eggs = User.total_eggs
    @total_corn = User.total_corn
    @total_sweet_potato = User.total_sweet_potato
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
  end
end
