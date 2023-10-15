class CookingRecord < ApplicationRecord
  belongs_to :operator, class_name: "User"
  belongs_to :terminator, class_name: "User", optional: true

  def finished?
    finished_at != nil && finished_at <= Time.now
  end
end
