class User < ApplicationRecord
  has_many :meals, foreign_key: :diner_id, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :egg_count, :corn_count, :sweet_potato_count, numericality: { greater_than_or_equal_to: 0}

  broadcasts_to ->(user) { "users" }, inserts_by: :prepend

  after_update_commit do
    broadcast_replace_to "total-eggs", target: "total-eggs", partial: "home/total_eggs", locals: { total_eggs: User.total_eggs }
    broadcast_replace_to "total-corn", target: "total-corn", partial: "home/total_corn", locals: { total_corn: User.total_corn }
    broadcast_replace_to "total-sweet-potato", target: "total-sweet-potato", partial: "home/total_sweet_potato", locals: { total_sweet_potato: User.total_sweet_potato }
  end

  def self.total_eggs
    User.all.sum(:egg_count)
  end

  def self.total_corn
    User.all.sum(:corn_count)
  end

  def self.total_sweet_potato
    User.all.sum(:sweet_potato_count)
  end
end
