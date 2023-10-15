class CookingRecordsController < ApplicationController
  def create
    # FIXME: Mock User ID
    mock_user_id = 1

    unless CookingRecord.last.finished?
      redirect_to root_path, status: :unprocessable_entity, alert: 'Cooking record was not created because there is a cooking record in progress.'
      return
    end
    if CookingRecord.create!(operator_id: mock_user_id, finished_at: 1.hour.from_now, egg_count: User.total_eggs, corn_count: User.total_corn)
      redirect_to root_path, notice: 'Cooking record was successfully created.'
    else
      redirect_to root_path, status: :unprocessable_entity, alert: 'Cooking record was not created.'
    end
  end

  def finish
    # FIXME: Mock User ID
    mock_user_id = 1

    # 若烹饪已结束，则提前退出
    cooking_record = CookingRecord.find(params[:id])
    if cooking_record.finished?
      redirect_to root_path, status: :temporary_redirect, alert: '烹饪已结束。'
      return
    end

    # 烹饪开始后的15分钟，不可以手动结束。
    if cooking_record.created_at > (Rails.env.development? ? 15.seconds.ago : 15.minutes.ago)
      redirect_to root_path, status: :temporary_redirect, notice: '烹饪开始后的15分钟，不可以手动结束。'
      return
    end

    if cooking_record.update(finished_at: Time.now, terminator_id: mock_user_id)
      redirect_to root_path, notice: 'Cooking record was successfully finished.'
    else
      redirect_to root_path, status: :unprocessable_entity, alert: 'Cooking record was not finished.'
    end
  end
end
