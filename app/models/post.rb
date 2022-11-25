class Post < ApplicationRecord
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
