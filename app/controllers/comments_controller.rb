class CommentsController < ApplicationController
  def new
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: comment } }
    end          
  end

  def create
    comment = Comment.new(params.require(:comment).permit(:text))
    # first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    # Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
    
    comment.post = current_user
    respond_to do |format|
      format.html do
        if comment.save          
          redirect_to "/users/#{post.author_id}"
          flash[:success] = "Post saved successfully"
        else
          flash.now[:error] = "Error: Post could not be saved"
          render :new, locals: { comment: comment }
        end
      end 
    end
  end 
end