class Comment < ApplicationRecord
  validates :text, presence: true
  after_save :update_comments_counter

  belongs_to :user
  belongs_to :post

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
