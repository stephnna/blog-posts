class UsersController < ApplicationController
  def index
    @users = User.all        
  end

  def show
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    @comment = Post.find(params[:id])
    Post.updates_posts_counter(@user.id)
    Comment.updates_comments_counter(@post.id)
    Like.updates_likes_counter(@post.id)
    @posts = User.three_recent_posts_for_user(@user.id)               
  end  
end
