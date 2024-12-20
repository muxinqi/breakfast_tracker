class UsersController < ApplicationController
  before_action :ensure_latest_cooking_finished, only: [ :new, :create, :increase_egg_count, :decrease_egg_count, :increase_corn_count, :decrease_corn_count ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: "用户添加成功～"
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def increase_egg_count
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(egg_count: @user.egg_count + 1)
        format.html { redirect_to root_path }
        format.turbo_stream
      else
        format.html { redirect_to root_path, error: @user.errors.full_messages.to_sentence }
      end
    end
  end

  def decrease_egg_count
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(egg_count: @user.egg_count - 1)
        format.html { redirect_to root_path }
        format.turbo_stream
      else
        format.html { redirect_to root_path, error: @user.errors.full_messages.to_sentence }
      end
    end
  end

  def increase_corn_count
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(corn_count: @user.corn_count + 1)
        format.html { redirect_to root_path }
        format.turbo_stream
      else
        format.html { redirect_to root_path, error: @user.errors.full_messages.to_sentence }
      end
    end
  end

  def decrease_corn_count
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(corn_count: @user.corn_count - 1)
        format.html { redirect_to root_path }
        format.turbo_stream
      else
        format.html { redirect_to root_path, error: @user.errors.full_messages.to_sentence }
      end
    end
  end

  def increase_sweet_potato_count
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(sweet_potato_count: @user.sweet_potato_count + 1)
        format.html { redirect_to root_path }
        format.turbo_stream
      else
        format.html { redirect_to root_path, error: @user.errors.full_messages.to_sentence }
      end
    end
  end

  def decrease_sweet_potato_count
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(sweet_potato_count: @user.sweet_potato_count - 1)
        format.html { redirect_to root_path }
        format.turbo_stream
      else
        format.html { redirect_to root_path, error: @user.errors.full_messages.to_sentence }
      end
    end
  end

  def food_consumption
    user = User.find(params[:id])
    cooking_records_group_by_day = CookingRecord.joins(:meals).where("meals.diner_id = ?", user.id).group_by_day(:created_at, range: 30.days.ago.midnight..Time.now.midnight)
    render json: [
      { name: "鸡蛋", color: "#F1DFC9", data: cooking_records_group_by_day.sum("meals.egg_count") },
      { name: "玉米", color: "#F4DC4A", data: cooking_records_group_by_day.sum("meals.corn_count") },
      { name: "红薯", color: "#BF6666", data: cooking_records_group_by_day.sum("meals.sweet_potato_count") }
    ]
  end

  private

  def user_params
    params.require(:user).permit(:name, :egg_count, :corn_count)
  end

  def ensure_latest_cooking_finished
    last_cooking_record = CookingRecord.last
    unless last_cooking_record.nil? or last_cooking_record.finished?
      redirect_to root_path, status: :temporary_redirect, warning: "当前烹饪还未完成，请烹饪结束后再试～"
    end
  end
end
