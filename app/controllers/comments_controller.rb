class CommentsController < ApplicationController
  
  def create
    comment = Comment.new(params.require(:comment).permit(:post_id, :text))
    # first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    # Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
    comment.author = current_user    
    if comment.valid?
      comment.save
      redirect_to user_post_comments_url    
    end
   
  end 
end