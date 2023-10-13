class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :egg_count, :corn_count, numericality: { greater_than_or_equal_to: 0}

  after_commit do
    broadcast_render_to "home#index"
  end
end
