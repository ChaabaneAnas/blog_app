class PostsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def index
     @user = User.find(params[:user_id])
     @posts = @user.posts
  end
end
