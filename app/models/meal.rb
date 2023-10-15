class Meal < ApplicationRecord
  belongs_to :diner, class_name: "User"
  belongs_to :cooking, class_name: "CookingRecord"

  validates :egg_count, :corn_count, numericality: { greater_than_or_equal_to: 0}
end
