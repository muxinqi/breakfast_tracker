class CookingRecordsController < ApplicationController
  def create
    last_cooking_record = CookingRecord.last
    unless last_cooking_record.nil? or last_cooking_record.finished?
      redirect_to root_path, status: :unprocessable_entity, warning: '当前有未结束的烹饪，请刷新页面查看最新状态。'
      return
    end

    success = ActiveRecord::Base.transaction do
      cooking = CookingRecord.create!
      User.all.where("egg_count > 0 OR corn_count > 0 OR sweet_potato_count > 0").each do |user|
        Meal.create!(diner_id: user.id, cooking_id: cooking.id, egg_count: user.egg_count, corn_count: user.corn_count, sweet_potato_count: user.sweet_potato_count)
      end
    end
    if success
      redirect_to root_path, success: '操作成功，开始烹饪啦。'
    else
      redirect_to root_path, status: :unprocessable_entity, error: '操作失败，请稍后再试。'
    end
  end

  def finish
    # 若烹饪已结束，则提前退出
    cooking_record = CookingRecord.find(params[:id])
    if cooking_record.finished?
      redirect_to root_path, status: :temporary_redirect, warning: '烹饪已结束，请刷新页面查看最新状态。'
      return
    end

    # 烹饪开始后的15分钟，不可以手动结束。
    if cooking_record.created_at > (Rails.env.development? ? 15.seconds.ago : 15.minutes.ago)
      redirect_to root_path, status: :temporary_redirect, warning: '烹饪开始后的15分钟，不可以手动结束。'
      return
    end

    if cooking_record.update(finished_at: Time.now)
      redirect_to root_path, success: '操作成功，本次烹饪已添加至历史成就。'
    else
      redirect_to root_path, status: :unprocessable_entity, error: '操作失败，请稍后再试。'
    end
  end
end
