class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    comment = Comment.new(params.require(:comment).permit(:post_id, :text))
    comment.author = current_user
    return unless comment.valid?

    comment.save
    Comment.updates_comments_counter(comment.post_id)
    redirect_to user_post_comments_url
  end
end
