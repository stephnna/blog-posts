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
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end          
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    post.author = current_user
    respond_to do |format|
      format.html do
        if post.save          
          redirect_to "/users/#{post.author_id}"
          flash[:success] = "Post saved successfully"
        else
          flash.now[:error] = "Error: Post could not be saved"
          render :new, locals: { post: post }
        end
      end 
    end
  end
end
