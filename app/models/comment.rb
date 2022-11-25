class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_c id
    Post.find(id).increment!(:comments_counter)
  end
end
