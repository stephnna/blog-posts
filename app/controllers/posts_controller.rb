class PostsController < ApplicationController
  def index    
    @users = User.find(params[:id])
    @user = Post.find(@user.id)             
  end

  def show
    @post = Post.find(params[:id])          
  end
end

