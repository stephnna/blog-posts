class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.includes(posts: [comments: [:author]]).find(params[:user_id])
  end

  def show
    @post = Post.includes(comments: [:author]).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new post_params
   
    post.author = current_user
    if post.valid?
      post.save
      redirect_to user_path(post.author_id)
    else
      redirect_to user_posts_url
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to user_post_path(current_user, @post)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
