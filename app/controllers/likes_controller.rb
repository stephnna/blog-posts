class LikesController < ApplicationController
  def create
    like = Like.new(params.require(:like).permit(:post_id))
    like.author = current_user
    return unless like.valid?

    like.save
    Like.updates_likes_counter(like.post_id)
    redirect_to user_post_likes_url
  end
end
