class PostsController < ApplicationController
  def index
    @user = current_user
    @comments_all = Post.five_recent_comments_for_post(@user.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    post = Post.new              
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    post.author = current_user
    if post.valid?
      post.save
      redirect_to "/users/#{post.author_id}"
    else
      redirect_to user_posts_url
    end    
  end
end

