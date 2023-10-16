class HomeController < ApplicationController
  def index
    @users = User.includes(:meals).all
    @total_eggs = User.total_eggs
    @total_corn = User.total_corn
    last_cooking_record = CookingRecord.last
    @in_progress_cooking_record = last_cooking_record unless last_cooking_record.finished?
    @cooking_records = CookingRecord.includes(:meals => :diner).order(created_at: :desc).limit(10)
    @total_eaten_meal = Meal.count
    @total_eaten_eggs = CookingRecord.not(finished_at: nil).where("finished_at < ?", Time.now).sum(:egg_count)
    @total_eaten_corn = CookingRecord.not(finished_at: nil).where("finished_at < ?", Time.now).sum(:corn_count)
  end
end
