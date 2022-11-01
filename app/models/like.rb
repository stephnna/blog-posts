class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  scope :updates_likes_counter, lambda { |id_value|
    Post.find(id_value).update(likes_counter: Like.where(post_id: id_value).count(:author_id))
  }
end
