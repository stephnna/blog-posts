class PostsController < ApplicationController
  def index
    @user = current_user
    @comments_all = Post.five_recent_comments_for_post(@user.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new          
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user

    if @post.valid?
      @post.save
      redirect_to user_posts_path(current_user)
    else
      redirect_to new_post_path
    end
  end
end
