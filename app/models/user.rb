class User < ApplicationRecord
  has_many :posts
  has_many :comments
  
  scope :three_recent_posts_with_posts, -> {}    
end
