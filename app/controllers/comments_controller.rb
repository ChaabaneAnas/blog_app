class CommentsController < ApplicationController
  def index
    @c_post = Post.find(params[:post_id])
    @comments = c_post.comments
  end

  def show; end

  def new; end
end
