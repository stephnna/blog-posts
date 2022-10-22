class User < ApplicationRecord
  has_many :posts
  has_many :comments

  scope :three_recent_posts_for_user, lambda { |id_value|
                                        Post.where(user_id: id_value).limit(3).order(created_at: :desc)
                                      }
end
