class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  has_many :posts
  has_many :comments
  has_many :likes

  def role?
    role == 'admin'
  end

  def recent
    posts.order(created_at: :desc).limit(3)
  end
end
