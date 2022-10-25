class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  scope :updates_comments_counter, lambda { |id_value|
                                     Post.find(id_value).update(comments_counter: Comment.where(post_id: id_value).count(:text))
                                   }
end
