class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }  
  validates :likes_counter, numericality: { only_integer: true },  comparison: { greater_than_or_equal_to: 0 }  



  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def self.update(id)
    User.find(id).increment!(:post_counter)
  end

  def self.recent(id)
    Comment.limit(5).order(created_at: :asc).where("post_id = #{id}")
  end
end
