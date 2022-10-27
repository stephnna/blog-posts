class PostsController < ApplicationController
  def index    
    @user = User.find()         
  end

  def show      
  end
end

