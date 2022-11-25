class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_l id
    Post.find(id).increment!(:likes_counter)
  end 
end
