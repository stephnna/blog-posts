class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = User.three_recent_posts_for_user(@user.id)               
  end  
end
