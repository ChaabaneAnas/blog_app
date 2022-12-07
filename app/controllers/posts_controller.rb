class PostsController < ApplicationController
  def show
    @user = User.includes(:posts).where("id = #{params[:user_id]}").first
    @post = @user.posts.filter { |post| post.id = params[:id] }.first
    @comments = Comment.includes(:user)
  end

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to "/users/#{current_user.id}/posts"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
