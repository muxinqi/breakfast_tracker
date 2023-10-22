class CookingRecord < ApplicationRecord
  has_many :meals, foreign_key: :cooking_id, dependent: :destroy

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
end
