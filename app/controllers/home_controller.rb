class HomeController < ApplicationController
  layout "changelog", only: [:changelog]

  def index
    @users = User.includes(:meals).all
    @total_of_today = User.total_of_today
    @in_progress_cooking_record = CookingRecord.in_progress_cooking_record
    @cooking_records = CookingRecord.includes(:meals => :diner).order(created_at: :desc).limit(10)
    @total_eaten_meal = Meal.count
    finished_cooking_records = CookingRecord.includes(:meals).where("finished_at < ?", Time.now)
    @total_eaten_eggs = finished_cooking_records.sum { |cr| cr.meals.sum(:egg_count) }
    @total_eaten_corn = finished_cooking_records.sum { |cr| cr.meals.sum(:corn_count) }
    @total_eaten_sweet_potato = finished_cooking_records.sum { |cr| cr.meals.sum(:sweet_potato_count) }
  end

  def changelog
  end

  def food_consumption
    cooking_records_group_by_day = CookingRecord.joins(:meals).group_by_day(:created_at, range: 30.days.ago.midnight..Time.now.midnight)
    render json: [
      { name: "鸡蛋", color: "#F1DFC9", data: cooking_records_group_by_day.sum("meals.egg_count") },
      { name: "玉米", color: "#F4DC4A",data: cooking_records_group_by_day.sum("meals.corn_count") },
      { name: "红薯", color: "#BF6666",data: cooking_records_group_by_day.sum("meals.sweet_potato_count") }
    ]
  end
end
