class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    Post.updates_posts_counter(@user.id)
    @posts = User.three_recent_posts_for_user(@user.id)
  end
end
