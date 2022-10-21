class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  scope :three_recent_posts, ->  { Post.joins(:user).where(user_id: 1).limit(3).order(created_at: :desc) }
end

