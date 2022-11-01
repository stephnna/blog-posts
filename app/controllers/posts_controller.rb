class PostsController < ApplicationController
  def index
    @user = current_user
    @comments_all = Post.five_recent_comments_for_post(@user.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @author = Post.new
    respond_to do |format|
      format.html { render :new, locals: { author: @author } }
    end          
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user

    if @post.valid?
      @post.save
      redirect_to new_user_post_url(current_user)
    else
      redirect_to new_post_path_url
    end
  end
end
