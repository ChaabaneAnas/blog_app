class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(post: @post, user: current_user)
    if @like.save
      redirect_to user_post_path(id: @post.id)
    else
      render :new
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
