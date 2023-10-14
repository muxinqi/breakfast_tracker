class UsersController < ApplicationController
  before_action :ensure_latest_cooking_finished, only: [:new, :create, :increase_egg_count, :decrease_egg_count, :increase_corn_count, :decrease_corn_count]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "用户创建成功～"
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def increase_egg_count
    @user = User.find(params[:id])
    @user.update(egg_count: @user.egg_count + 1)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  def decrease_egg_count
    @user = User.find(params[:id])
    @user.update(egg_count: @user.egg_count - 1)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  def increase_corn_count
    @user = User.find(params[:id])
    @user.update(corn_count: @user.corn_count + 1)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  def decrease_corn_count
    @user = User.find(params[:id])
    @user.update(corn_count: @user.corn_count - 1)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :egg_count, :corn_count)
  end

  def ensure_latest_cooking_finished
    unless CookingRecord.last.finished?
      redirect_to root_path, status: :temporary_redirect, notice: "当前烹饪还未完成，请烹饪结束后再试～"
    end
  end
end
