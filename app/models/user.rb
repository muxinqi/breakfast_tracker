class User < ApplicationRecord
  has_many :meals, foreign_key: :diner_id, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :egg_count, :corn_count, :sweet_potato_count, numericality: { greater_than_or_equal_to: 0}

  broadcasts_to ->(user) { "users" }, inserts_by: :prepend

  after_update_commit do
    broadcast_replace_to "total-of-today",
                         target: "total-of-today",
                         partial: "home/total_of_today",
                         locals: { data: User.total_of_today }
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

  def self.total_of_today
    { egg: User.total_eggs, corn: User.total_corn, sweet_potato: User.total_sweet_potato }
  end
end
