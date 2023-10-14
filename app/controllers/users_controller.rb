class UsersController < ApplicationController
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
    @user.egg_count = @user.egg_count + 1
    @user.save
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def decrease_egg_count
    @user = User.find(params[:id])
    @user.egg_count = @user.egg_count - 1
    @user.save
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def increase_corn_count
    @user = User.find(params[:id])
    @user.corn_count = @user.corn_count + 1
    @user.save
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def decrease_corn_count
    @user = User.find(params[:id])
    @user.corn_count = @user.corn_count - 1
    @user.save
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :egg_count, :corn_count)
  end
end
