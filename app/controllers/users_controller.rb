class UsersController < ApplicationController
  def index
    @users = User.all        
  end

  def show
    @user = current_user
    @post = Post.find(@user.id)
    @comment = Comment.find(@post.author_id)
    @like = Like.find(@post.author_id)
   
    Post.updates_posts_counter(@user.id)
    Comment.updates_comments_counter(@comment.post_id)
    Like.updates_likes_counter(@like.post_id)
    @posts = User.three_recent_posts_for_user(@user.id)               
  end  
end
