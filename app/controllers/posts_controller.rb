class PostsController < ApplicationController
  def index
    @user = User.find(1)
    @comments_all = Post.five_recent_comments_for_post(@user.id)
  end

  def show
    @post = Post.find(params[:id])
  end
end
