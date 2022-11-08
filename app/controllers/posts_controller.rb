class PostsController < ApplicationController
  def index
    @user = User.includes(posts: [comments: [:author]]).find(1)    
  end

  def show
    @post = Post.includes(comments: [:author]).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(params.require(:post).permit(:title, :text))
    post.author = current_user
    if post.valid?
      post.save
      redirect_to user_path(post.author_id)
    else
      redirect_to user_posts_url
    end
  end
end
