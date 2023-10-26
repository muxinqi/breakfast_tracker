class CookingRecord < ApplicationRecord
  has_many :meals, foreign_key: :cooking_id, dependent: :destroy

  after_save_commit do
    CookingRecord.update_control_panel
  end

  def finished?
    finished_at != nil && finished_at <= Time.now
  end

  def egg_count
    meals.sum(:egg_count)
  end

  def corn_count
    meals.sum(:corn_count)
  end

  def sweet_potato_count
    meals.sum(:sweet_potato_count)
  end

  def self.in_progress_cooking_record
    last_cooking_record = CookingRecord.last
    if last_cooking_record.nil? || last_cooking_record.finished?
      nil
    else
      last_cooking_record
    end
  end

  def self.update_control_panel
    Turbo::StreamsChannel.broadcast_replace_to "cooking-control-panel",
                         target: "cooking-control-panel",
                         partial: "home/cooking_control_panel",
                         locals: { in_progress_cooking_record: CookingRecord.in_progress_cooking_record }
  end
end
