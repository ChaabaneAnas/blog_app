class User < ApplicationRecord
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  has_many :posts
  has_many :comments
  has_many :likes

  def recent
    posts.order(created_at: :desc).limit(3)
  end
end
