class HomeController < ApplicationController
  def index
    @users = User.all
    @total_eggs = User.all.sum(:egg_count)
    @total_corn = User.all.sum(:corn_count)
  end
end
