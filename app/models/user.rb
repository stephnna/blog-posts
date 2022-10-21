class User < ApplicationRecord
  has_many :posts
  has_many :comments
  
  scope :three_recent_posts, -> { Post.where(user_id: 2).limit(3).order(created_at: :desc) }   
end
