class HomeController < ApplicationController
  def index
    @users = User.all
    @total_eggs = User.total_eggs
    @total_corn = User.total_corn
    last_cooking_record = CookingRecord.last
    @in_progress_cooking_record = last_cooking_record unless last_cooking_record.finished?
    @cooking_records = CookingRecord.all
  end
end
