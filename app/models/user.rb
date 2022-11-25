class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  
  def self.rec_3 id
    Post.limit(3).order(created_at: :asc).where("user_id = #{id}")
 end

end
