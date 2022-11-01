class PostsController < ApplicationController
  def index
    @user = User.find(1)
  end

  def show
    @post = Post.find(params[:id])
  end
end
