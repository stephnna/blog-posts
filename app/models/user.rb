class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  scope :three_recent_posts_for_user, lambda { |id_value|
                                        Post.where(author_id: id_value).limit(3).order(created_at: :desc)
                                      }
end
