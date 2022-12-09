class CommentsController < ApplicationController
  def index
    @c_post = Post.find(params[:post_id])
    @comments = c_post.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @current_post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @current_post
    @comment.user = current_user
    if @comment.save
      redirect_to "/users/#{current_user.id}/posts/#{@current_post.id}"
    else
      render :new
    end
  end

  def destroy
    Comment.destroy(params[:id])
    redirect_to user_posts_path
  end

  def show; end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
